class Task < ApplicationRecord
include SimpleCalendar
  CATEGORIES = ['Work', 'Personal', 'Study', 'Other'].freeze
  enum status: { pending: 'pending', completed: 'completed' }
end
