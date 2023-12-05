class ReminderController < ApplicationController
  def index
    @reminders_within_week = Reminder.due_within_week
    @reminders_within_30_days = Reminder.due_within_30_days
  end
end
