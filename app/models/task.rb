class Task < ApplicationRecord
  CATEGORIES = ['Work', 'Personal', 'Study', 'Other'].freeze
  enum status: { pending: 'pending', completed: 'completed' }
end
