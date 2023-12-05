class DashboardController < ApplicationController
  def index
  # @user = current_user
  # @current_user = "Test User"
  @current_date = Date.today
  @random_quote = "This is a sample quote"
  @recent_entries = Entry.order(created_at: :desc).limit(5)
  @upcoming_reminders = Reminder.where('date >= ?', DateTime.now).order(date: :asc).limit(5)
  @tasks = Task.all
  @reminders_within_week = Reminder.where('date <= ?', 1.week.from_now)
  @reminders_within_30_days = Reminder.where('date <= ?', 30.days.from_now)
  end
end
