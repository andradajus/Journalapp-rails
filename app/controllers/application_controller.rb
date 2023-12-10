class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])

    if @current_user.nil?
      session[:user_id] = nil
      flash[:alert] = 'Session expired. Please log in again.'
      redirect_to login_path
    end

    @current_user
  end
end
