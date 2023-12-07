class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @calendar_events = @tasks.map { |task| { title: task.name, start: task.deadline } }
    @current_date = Date.today
    @tasks_due_today = Task.where(deadline: Date.today)
    @tasks_due_tomorrow = Task.where(deadline: Date.tomorrow)
    @tasks_within_week = Task.where('deadline <= ?', 1.week.from_now)
    @tasks_within_30_days = Task.where('deadline <= ?', 30.days.from_now)
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
    @current_date = Date.today
    @random_quote = "This is a sample quote"
    @recent_entries = Entry.order(created_at: :desc).limit(5)
    @upcoming_reminders = Reminder.where('date >= ?', DateTime.now).order(date: :asc).limit(5)
    @tasks = Task.all
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

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:category, :task, :deadline, :status, :description)
  end

end
