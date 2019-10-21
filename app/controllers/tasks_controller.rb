class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:task].present? && params[:task][:search]
      @tasks = Task.title_scope(params[:task][:title]).status_scope(params[:task][:status])
    else
      @tasks = Task.all
    end
    if params[:sort_expired]
      @tasks = @tasks.order(deadline: :desc)
    else
      @tasks = @tasks.order(created_at: :desc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "作成しました"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "編集しました"
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "削除しました"
      redirect_to tasks_path
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

end
