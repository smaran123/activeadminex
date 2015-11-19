class Task < ActiveRecord::Base
 #   default_scope -> { order('created_at DESC') }
 # scope :completed, where(:completed =>true)
  scope :completed, -> { where(completed: true) }
 # scope :incomplete, where(:completed =>false)
 scope :incomplete, -> {where(completed: false)}
end
