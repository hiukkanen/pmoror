class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @projects.delete_if { |p| p.all_ready? }
    @project = Project.new
    @project.build_customer
  end

  def create
    require 'pp'
    @project = Project.new params[:project]
    if @project.save
      @project = Project.new
    end
    redirect_to projects_path   
  end

end
