class ProjectsController < ApplicationController

  def index
    @project_group = ProjectGroup.find params['group-id']
    @project_group.projects.delete_if { |project| project.all_ready? }
    @selected_id = params[:selected]
  end

  def create
    project = Project.new params[:project]
    project.save
    group_id = params[:project][:'project_group_id']
    redirect_to projects_path('group-id' => group_id) 
  end

  def name
    update_attribute "name", params
  end

  def description
    update_attribute "description", params
  end

  def state
    update_attribute "state", params
  end

  def update_attribute(attribute, params)
    project = Project.find params[:id]
    value = params[:value]
    project.send attribute+"=", value
    project.save!
    render :text => (project.send attribute)
  end

  def update_time_attribute(attribute, params)
    params[:value] =~ / *([^ ]+) */
    params[:value] = $1
    update_attribute attribute, params
  end

  def start_date
    update_time_attribute "start_date", params
  end

  def end_date
    update_time_attribute "end_date", params
  end

end
