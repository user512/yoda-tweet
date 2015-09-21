module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    session[:user_id] == params[:id].to_i
  end

  def logged_in?
    !current_user.nil?
  end


  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def check_session
    render file: "#{Rails.root}/public/422.html", layout: false, status: 422 if current_user? == false
  end

end
