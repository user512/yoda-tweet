class SessionsController < ApplicationController
include SessionsHelper
  def create
    byebug
    user = User.from_omniauth(env["omniauth.auth"])
    byebug
    session[:user_id] = user.id
    redirect_to show_path(session[:user_id])
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
