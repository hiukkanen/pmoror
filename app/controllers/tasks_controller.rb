class TasksController < ApplicationController
  def next
    task = Task.find params[:id]
    task.status.next
    task.status.save
    unless task.project.all_ready?
      render :text => task.status.css_class
    else
      render :text => "!ready"
    end
  end

  def comment
    task = Task.find params[:id]
    comment = params[:value]
    task.status.comment = comment
    task.status.save!
    render :text => params[:value]
  end
end
