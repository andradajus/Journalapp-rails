class Task < ApplicationRecord
belongs_to :user
CATEGORIES = ['Work', 'Personal', 'Study', 'Other'].freeze
enum status: { pending: 'Pending', completed: 'Completed' }
# validates :category, presence: true
# validates :task, presence: true
# validates :deadline, presence: true
# validates :description, presence: true
include SimpleCalendar
attr_accessor :name


# private

#   def deadline_cannot_be_in_the_past
#     if deadline&.present? && deadline < Date.today
#       errors.add(:deadline, "Invalid Date")
#     end
#   end
end
