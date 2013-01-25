class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_name] = user.name
    session[:user_picture] = user.image
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    session[:user_picture] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
