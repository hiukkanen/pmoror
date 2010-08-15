class TasksController < ApplicationController
  def next
    task = Task.find params[:id]
    task.status.next
    task.status.save
    unless task.project.all_ready?
      render :text => task.status.color
    else
      render :text => "!ready"
    end
  end
end
