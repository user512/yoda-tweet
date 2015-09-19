class UsersController < ApplicationController
include SessionsHelper
before_action :check_session

  def show

  end

  def tweet
    render 'tweet', layout: false
  end
end
