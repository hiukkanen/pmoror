class ProjectGroup < ActiveRecord::Base
  has_many :projects
  has_many :tasks, -> { order(:id) }, inverse_of: :project_group
  accepts_nested_attributes_for :tasks

  def new_project
    project = Project.new
    project.project_group = self
    project.build_customer
    project
  end
end
