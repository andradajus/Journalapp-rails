class TasksController < ApplicationController
  before_action :require_admin, only: [:index]
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.nil?
      redirect_to dashboard_path, alert: "Access denied."
    else
    @tasks = current_user.tasks.order(:position).all
    @calendar_events = @tasks.map { |task| { title: task.name, start: task.deadline } }
    @current_date = Date.today
    @tasks_due_today = current_user.tasks.where(deadline: Date.today)
    @tasks_due_tomorrow = current_user.tasks.where(deadline: Date.tomorrow)
    @tasks_within_week = current_user.tasks.where('deadline <= ?', 1.week.from_now)
    @tasks_within_30_days = current_user.tasks.where('deadline <= ?', 30.days.from_now)
    end
  end

  def show
    # ...
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.status = :pending

    if @task.save
      redirect_to dashboard_path, notice: 'Task was successfully created.'
    else
      render 'dashboard/index'
    end
  end


  def edit
    @user = current_user
    @tasks = current_user.tasks.order(:position).all
    @calendar_events = @tasks.map { |task| { title: task.name, start: task.deadline } }
    @current_date = Date.today
    @tasks_due_today = current_user.tasks.where(deadline: Date.today)
    @tasks_due_tomorrow = current_user.tasks.where(deadline: Date.tomorrow)
    @tasks_within_week = current_user.tasks.where('deadline <= ?', 1.week.from_now)
    @tasks_within_30_days = current_user.tasks.where('deadline <= ?', 30.days.from_now)
  end

  def update
    if @task.update(task_params)
      redirect_to dashboard_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to dashboard_path, notice: 'Task was successfully destroyed.'
    else
      flash[:alert] = 'Error destroying task.'
      redirect_to dashboard_path
    end
  end

  def update_status
    @task = Task.find(params[:id])

    if @task.update(status: params[:task][:status])
      redirect_to dashboard_path, notice: 'Status updated successfully.'
    else
      flash[:alert] = 'Error updating status.'
      redirect_to dashboard_path
    end
  end

  def move_up
    @task = Task.find(params[:id])
    @task.move_higher
    redirect_to dashboard_path, notice: 'Task moved up successfully.'
  end

  def move_down
    @task = Task.find(params[:id])
    @task.move_lower
    redirect_to dashboard_path, notice: 'Task moved down successfully.'
  end


  private


  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:category, :task, :deadline, :status, :description)
  end

  def require_admin
    if current_user.nil?
      redirect_to dashboard_path, alert: "Access denied."
    elsif (controller_name == 'users' || controller_name == 'tasks') && action_name == 'index' && !current_user.admin_status
      redirect_to dashboard_path, alert: "Access denied."
    end
  end

end
