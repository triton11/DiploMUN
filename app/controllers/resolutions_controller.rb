class ResolutionsController < ApplicationController
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]


  # GET /resolutions
  # GET /resolutions.json
  def index
    @resolutions = Resolution.all
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new
    @country = Country.find(session[:country_id])
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)
    @country = Country.find(session[:country_id])
    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Resolution was successfully created.' }
        @country.ping_c
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: 'Resolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_country
    set_resolution
    unless @resolution.countries.exists?(session[:country_id])
      @country = Country.find(session[:country_id])
      @resolution.countries << @country
      redirect_to @resolution
    end
  end

  def delete_country
    set_resolution
    @country = Country.find(session[:country_id])
    @resolution.countries.destroy(@country)
    redirect_to @resolution
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolution_params
      params.require(:resolution).permit(:name, :topic, :body)
    end
end
