class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  # @country_t = Country.new

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all
    @country = Country.find(session[:country_id])
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        session[:country_id] = @country.id
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def trade
    @country = Country.find(session[:country_id])
    @country_t = Country.find(params[:id])
    render :trade
  end

  def submit
    @country = Country.find(session[:country_id])
    @country_t = Country.find(params[:id].to_i)
    if ((@country.f_military - params[:f_military][:amount_fm].to_i 
      - params[:u_military][:amount_um].to_i) >= 0)
      @country.update(:resource => @country.resource - params[:resource][:amount_r].to_i,
       :funds => @country.funds - params[:funds][:amount_f].to_i,
       :r_energy => @country.r_energy - params[:r_energy][:amount_re].to_i,
       :n_energy => @country.n_energy - params[:n_energy][:amount_ne].to_i,
       :f_military => @country.f_military - params[:f_military][:amount_fm].to_i - params[:u_military][:amount_um].to_i)
      @country_t.update(:resource => @country_t.resource + params[:resource][:amount_r].to_i,
        :funds => @country_t.funds + params[:funds][:amount_f].to_i,
        :r_energy => @country_t.r_energy + params[:r_energy][:amount_re].to_i,
        :n_energy => @country_t.n_energy + params[:n_energy][:amount_ne].to_i,
        :f_military => @country_t.f_military + params[:f_military][:amount_fm].to_i,
        :u_military => @country_t.u_military + params[:u_military][:amount_um].to_i)
      redirect_to countries_path,  notice: 'Trade succeeded!'
    else
      redirect_to countries_path, notice: 'Trade failed.'
    end
  end

  def invest
    @country = Country.find(params[:id])
    render :invest
  end


  def enter
    @countries = Country.all
    @country = Country.find(params[:id])
    if ((@country.funds - params[:tech][:amount_t].to_i - 
      params[:education][:amount_e].to_i - params[:infrastructure][:amount_i].to_i) >= 0)
      @country.update(:tech => @country.tech + params[:tech][:amount_t].to_i,
        :education => @country.education + params[:education][:amount_e].to_i,
        :infrastructure => @country.infrastructure + params[:infrastructure][:amount_i].to_i,
        :f_military => @country.f_military + params[:military][:amount_m].to_i,
        :funds => @country.funds - params[:tech][:amount_t].to_i - params[:education][:amount_e].to_i - params[:infrastructure][:amount_i].to_i)
      redirect_to @country,  notice: 'Investment succeeded!'
    else
      redirect_to @country, notice: 'Investment failed.' 
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def event
    render "/countries/event"
  end

  def launch
    @event = params[:event_name][:title]
    @country = Country.find(params[:country][:country_id].to_i)
    @country.update(:u_military => @country.u_military + params[:military][:amount_m].to_i,
      :resource => @country.resource - params[:resource][:amount_r].to_i,
      :funds => @country.funds - params[:funds][:amount_f].to_i,
      :r_energy => @country.r_energy - params[:r_energy][:amount_re].to_i,
      :n_energy => @country.r_energy - params[:n_energy][:amount_ne].to_i,)
    @country.ping_a(@event)
    redirect_to countries_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :email, :password, :resource, :r_energy, :n_energy, :f_military, :u_military, :tech, :education, :infrastructure)
    end

    def log_in
      session[:country_id] = @country.id
    end
end
