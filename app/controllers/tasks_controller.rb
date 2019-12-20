class TasksController < ApplicationController
  def index
    @tasks = current_organization.tasks
  end

  def new
    @task = current_organization.tasks.new
  end

  def create
    @task = current_organization.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def show
    @task = current_organization.tasks.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :image, :execute_on)
  end
end
