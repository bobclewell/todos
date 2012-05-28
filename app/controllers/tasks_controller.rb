class TasksController < ApplicationController

  before_filter :authorize

  def index 
    @tasks = Task.where(:user_id => current_user.id).all    
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

end
