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
    @tasks = Task.all
    @tasks_due_today = Task.where(deadline: Date.today)
    @tasks_due_tomorrow = Task.where(deadline: Date.tomorrow)
    @tasks_within_week = Task.where('deadline <= ?', 1.week.from_now)
    @tasks_within_30_days = Task.where('deadline <= ?', 30.days.from_now)
    @calendar = SimpleCalendar::Calendar.new(date: Date.today)
  end
end
