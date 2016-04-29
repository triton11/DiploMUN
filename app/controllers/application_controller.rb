class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method def logged_in?
    session[:country_id]
  end

  helper_method def current_user
    @country = Country.find(session[:country_id]) if logged_in?
  end
end