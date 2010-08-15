class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    if @project.save
      @project = Project.new
    end
    redirect_to projects_path   
  end

end
