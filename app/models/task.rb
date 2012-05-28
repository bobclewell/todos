class Task < ActiveRecord::Base
  attr_accessible :completed_at, :description, :due_on, :order, :title, :user_id
  
  belongs_to :user

  scope :incomplete, where('completed_at IS NULL')

  validates_presence_of :title

end
