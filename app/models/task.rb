class Task < ApplicationRecord
include SimpleCalendar
  CATEGORIES = ['Work', 'Personal', 'Study', 'Other'].freeze
  enum status: { pending: 'Pending', completed: 'Completed' }
  attr_accessor :name
end
