class Reminder < ApplicationRecord
  # belongs_to :user
  class Reminder < ApplicationRecord
    scope :due_within_week, -> { where('date <= ?', 1.week.from_now) }
    scope :due_within_30_days, -> { where('date <= ?', 30.days.from_now) }
  end
end
