class UsersController < ApplicationController
include SessionsHelper,UsersHelper
before_action :check_session
require 'yodaspeak'

  def show

  end

  def tweet
    message = yodaish(params[:tweet])
    current_user.tweet(message)
    redirect_to show_path
  end
end
