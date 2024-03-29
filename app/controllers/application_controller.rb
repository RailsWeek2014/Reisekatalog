class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end
  

  def after_sign_in_path_for(resource)
  	if resource.admin?
  		acp_path
  	else
  		request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  	end
  end

  #check_authorization
end
