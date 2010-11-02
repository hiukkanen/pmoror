class ProjectGroupsController < ApplicationController

  def new
    @project_group = ProjectGroup.new
    id = params['id'] || params['tasks']
    id.to_i.times { @project_group.tasks.build }
  end

  def edit
    @project_group = ProjectGroup.find params[:id]
  end

  def index
    @project_groups = ProjectGroup.all
  end

  def create
    @project_group = ProjectGroup.new params[:project_group]
    @project_group.save ? redirect_to(project_group_path(@project_group)) : render(:action => :new)
  end

  def update
    project_group = ProjectGroup.find params[:id]
    project_group.update_attributes params[:project_group]
    redirect_to project_groups_path
  end

end
