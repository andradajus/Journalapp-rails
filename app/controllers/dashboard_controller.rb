class DashboardController < ApplicationController
  def index
    @user = current_user

    if @user.nil?
      redirect_to login_path, alert: 'Please log in.'
      return
    end

    @current_date = Date.today
    @random_quote = "This is a sample quote"
    @recent_entries = Entry.order(created_at: :desc).limit(5)
    @tasks = current_user.tasks.order(:position).all
    @tasks_due_today = current_user.tasks.where(deadline: Date.today)
    @tasks_due_tomorrow = current_user.tasks.where(deadline: Date.tomorrow)
    @tasks_within_week = current_user.tasks.where('deadline <= ?', 1.week.from_now)
    @tasks_within_30_days = current_user.tasks.where('deadline <= ?', 30.days.from_now)
  end
end
