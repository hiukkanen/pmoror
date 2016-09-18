class ProjectsController < ApplicationController
  def index
    @project_group = ProjectGroup.find params['group-id']
    ProjectRemover.new.remove_all_ready(@project_group) unless params[:all] == '1' 
    @selected_id = params[:selected]
  end

  def create
    project = Project.new project_params
    project.customer = Customer.new
    group_id = params[:project][:project_group_id]
    project.project_group = ProjectGroup.find group_id
    project.save!
    redirect_to projects_path('group-id' => group_id)
  end

  private

  def name
    update_attribute 'name', params
  end

  def description
    update_attribute 'description', params
  end

  def state
    update_attribute 'state', params
  end

  def update_attribute(attribute, params)
    project = Project.find params[:id]
    value = params[:value]
    project.send attribute + '=', value
    project.save!
    render text: (project.send attribute)
  end

  def update_time_attribute(attribute, params)
    params[:value] =~ / *([^ ]+) */
    params[:value] = Regexp.last_match(1)
    update_attribute attribute, params
  end

  def start_date
    update_time_attribute 'start_date', params
  end

  def end_date
    update_time_attribute 'end_date', params
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
