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
    @project_group = ProjectGroup.new project_group_params
    pp @project_group.valid?
    pp @project_group.errors.full_messages
    @project_group.save ? redirect_to(project_groups_path) : render(action: :new)
  end

  def update
    project_group = ProjectGroup.find params[:id]
    project_group.update_attributes params[:project_group]
    redirect_to project_groups_path
  end

  def destroy
    project_group = ProjectGroup.find params[:id]
    project_group.projects.each do |project|
      project.tasks.each do |task|
        task.status.destroy if task.status
        task.destroy
      end
      project.customer.destroy if project.customer
      project.destroy
    end
    project_group.tasks.each(&:destroy)
    project_group.destroy
    redirect_to project_groups_path
  end

  private

  def project_group_params
    params.require(:project_group).permit(:name, tasks_attributes: [:id, :name])
  end
end
