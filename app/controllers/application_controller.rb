class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Setting the user method here will allow us to call it from anywhere whitin hte application
  def set_user
      @user = User.find(params[:user_id])
  end
end
