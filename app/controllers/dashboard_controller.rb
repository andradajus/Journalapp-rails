class DashboardController < ApplicationController
  def index
  # @user = current_user
  # @current_user = "Test User"
  @current_date = Date.today
  @random_quote = "This is a sample quote"
  @recent_entries = Entry.order(created_at: :desc).limit(5)
  @upcoming_reminders = Reminder.where('date >= ?', DateTime.now).order(date: :asc).limit(5)
  end
end
