class TasksController < ApplicationController
  def next
    task = Task.find params[:id]
    task.status.next
    task.status.save
    if task.project.all_ready?
      render text: '!ready'
    else
      render text: task.status.css_class
    end
  end

  def comment
    task = Task.find params[:id]
    comment = params[:value]
    task.status.comment = comment
    task.status.save!
    render text: params[:value]
  end
end
