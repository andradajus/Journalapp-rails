class ReminderController < ApplicationController
  def index
    @reminders_due_today = Reminder.due_today
    @reminders_due_tomorrow = Reminder.due_tomorrow
    @reminders_within_week = Reminder.due_within_week
    @reminders_within_30_days = Reminder.due_within_30_days
  end
end
