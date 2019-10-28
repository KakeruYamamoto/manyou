class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
  before_action :logout_recommend, only: [:new]

  def index
    @users = User.all.order("created_at ASC")
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user.id), notice: '登録完了！ログインしました！'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: '削除しました'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
