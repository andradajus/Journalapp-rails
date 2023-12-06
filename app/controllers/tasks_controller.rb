class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @calendar_events = @tasks.map { |task| { title: task.name, start: task.deadline } }
    @current_date = Date.today
  end

  def show
    # ...
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    @reminders_within_week = Reminder.where('date <= ?', 1.week.from_now)
    @reminders_within_30_days = Reminder.where('date <= ?', 30.days.from_now)
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
