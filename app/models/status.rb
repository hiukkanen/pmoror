class Status < ActiveRecord::Base
  belongs_to :task
  validates_presence_of :task, :code
end
