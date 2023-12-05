class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # ...
  end

  def new
    @task = Task.new
    @task = Task.new(status: 'pending')
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to dashboard_path, notice: 'Task was successfully created.'
    else
      render 'dashboard/index'
    end
  end

  def edit
    # ...
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:category, :task, :deadline)
  end
end
