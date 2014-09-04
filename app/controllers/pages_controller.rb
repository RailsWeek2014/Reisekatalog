class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]

  def home
  	render content:'home'
  end

  def register
  	if user_signed_in?
  		redirect_to 'pages#home'
  	else
  		render 'devise/registrations#register'
  	end
  end

  def login
  end

  def logout
  end

  def profile
  end



end
