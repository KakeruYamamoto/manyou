class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
      redirect_to admin_user_path(@user.id), notice: '登録しました'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: '更新しました'
    else
      redirect_to edit_admin_user_path(@user.id), notice: '更新できません'
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_url, notice: '削除しました'
    else
      redirect_to admin_users_url, notice: '削除できません'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
