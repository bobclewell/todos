class TasksController < ApplicationController
  before_filter :authorize

  def index 
    @tasks = Task.order('position').incomplete.where(:user_id => current_user.id).all
  end

  # GET /task/new
  def new
    @task = Task.new
  end

  # POST /tasks
  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to tasks_path
    else
      render action: "new"
    end
  end

  # Custom actions
  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  def completed
    @task = Task.find(params[:id])
    @task.completed_at = Time.now
    @task.save
    redirect_to tasks_path
  end
end
