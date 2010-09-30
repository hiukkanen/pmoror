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
