class ProjectGroup < ActiveRecord::Base
  has_many :projects
  has_many :tasks
  accepts_nested_attributes_for :tasks
end
