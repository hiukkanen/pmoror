class ProjectGroupsController < ApplicationController

  def new
    @project_group = ProjectGroup.new
  end
end
