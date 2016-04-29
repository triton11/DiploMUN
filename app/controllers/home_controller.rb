class HomeController < ApplicationController
	def index
    @country = Country.find(session[:country_id])
    # @country.ping
    @inter = Inter.find(1)
    if @country.name == 'Admin'
      render '/home/index'
    else
      @headline = @country.getNews
      render '/home/main'
    end
  end

  def next_round
    @country = Country.find(session[:country_id])
    @countries = Country.all
    @inter = Inter.find(1)
    @countries.each do |country|
      unless (country.name == "Admin")
        country.change
        country.save
      end
    end
    @inter.change
    @inter.save
    @country.ping_b
    redirect_to @country
  end

  def calculate
    @country = Country.find(session[:country_id])
    @inter = Inter.find(1)
    @countries = Country.all
    @countries.each do |country|
      unless (country.name == "Admin")
        @inter.update(:global => @inter.global + country.economy,
          :iclimate => @inter.iclimate + country.climate,
          :iquality => @inter.iquality + country.quality)
      end
    end
    redirect_to @country
  end

end
