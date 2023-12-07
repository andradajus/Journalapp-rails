class Task < ApplicationRecord
acts_as_list
belongs_to :user
CATEGORIES = ['Work', 'Personal', 'Study', 'Other'].freeze
enum status: { pending: 'Pending', completed: 'Completed' }

include SimpleCalendar
attr_accessor :name

# validates :category, presence: true
# validates :task, presence: true
# validates :deadline, presence: true
# validates :description, presence: true
# private

#   def deadline_cannot_be_in_the_past
#     if deadline&.present? && deadline < Date.today
#       errors.add(:deadline, "Invalid Date")
#     end
#   end
end
