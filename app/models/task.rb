class Task < ActiveRecord::Base
  attr_accessible :completed_at, :description, :due_on, :order, :title, :user_id
end
