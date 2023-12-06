class Reminder < ApplicationRecord
  # belongs_to :user
  scope :due_today, -> { where(date: Date.today) }
  scope :due_tomorrow, -> { where(date: Date.tomorrow) }
  scope :due_within_week, -> { where('date <= ?', 1.week.from_now) }
  scope :due_within_30_days, -> { where('date <= ?', 30.days.from_now)
  end
end
