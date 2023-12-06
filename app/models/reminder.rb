class Reminder < ApplicationRecord
  # belongs_to :user
  scope :due_today, -> { where(date: Date.today).order(:date) }
scope :due_tomorrow, -> { where(date: Date.tomorrow).order(:date) }
scope :due_within_week, -> { where('date <= ?', 1.week.from_now).order(:date) }
scope :due_within_30_days, -> { where('date <= ?', 30.days.from_now).order(:date) }
end
