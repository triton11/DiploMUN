class SessionController < ApplicationController
	def new
		render 'session/new'
	end

	def create
	  @country = Country.find_by(name: params[:name])
	  unless @country.nil?
      if @country.password_hash == params[:password]
        session[:country_id] = @country.id
        redirect_to @country
      else 
      	redirect_to '/login'
      end
    else
      redirect_to '/login'
	  end
	end

	def destroy
		reset_session
		redirect_to('/')
	end
end
