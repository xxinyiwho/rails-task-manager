class TasksController < ApplicationController
  before_action :show, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    task_new = Task.create(strong_params)
    redirect_to task_path(task_new)
  end

  def edit
    # @task = Task.find(params[:id].to_i)
  end

  def update
    # @task = Task.find(params[:id].to_i)
    @task.update(strong_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to tasks_path
  end

private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
