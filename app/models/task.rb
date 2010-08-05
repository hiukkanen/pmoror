class Task < ActiveRecord::Base
  validates_presence_of :name, :status, :project
  belongs_to :project
end
