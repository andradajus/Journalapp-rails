class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])

    if @current_user.nil?
      # Handle the situation where the user is not found
      session[:user_id] = nil  # Clear the session to prevent further issues
      flash[:alert] = 'Session expired. Please log in again.'
      redirect_to login_path
    end

    @current_user
  end
end
