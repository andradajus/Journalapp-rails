class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username_or_email]) || User.find_by(email: params[:username_or_email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username/email or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
