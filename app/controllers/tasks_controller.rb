class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :forbid_correct_user, only: [:edit, :update, :destroy]

  PER = 10

  def index
    if params[:task].present? && params[:task][:search]
      @tasks = Task.title_scope(params[:task][:title])
                   .status_scope(params[:task][:status])
                   .label_scope(params[:task][:label_id])
                   .user_scope(current_user.id)
                   .page(params[:page]).per(PER)
    else
      @tasks = Task.all.user_scope(current_user.id).page(params[:page]).per(PER)
    end
    if params[:sort_expired]
      @tasks = @tasks.order(deadline: :desc).page(params[:page]).per(PER)
    elsif params[:sort_priority]
      @tasks = @tasks.order(priority: :desc).page(params[:page]).per(PER)
    else
      @tasks = @tasks.order(created_at: :desc).page(params[:page]).per(PER)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    if params[:task][:label_ids].nil?
      params.require(:task).permit(:title, :content, :deadline, :status, :priority, :label_id).merge(label_ids: [])
    else
      params.require(:task).permit(:title, :content, :deadline, :status, :priority, :label_id, label_ids: [])
    end
  end
end