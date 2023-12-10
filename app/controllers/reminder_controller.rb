class ReminderController < ApplicationController
  def index
    @reminders_due_today = current_user.reminders.due_today
    @reminders_due_tomorrow = current_user.reminders.due_tomorrow
    @reminders_within_week = current_user.reminders.due_within_week
    @reminders_within_30_days = current_user.reminders.due_within_30_days
  end
end
