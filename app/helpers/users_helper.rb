module UsersHelper

  def admin_user
    redirect_to users_path, notice: '管理者権限がありません' unless current_user.admin?
  end

  def admin_user_new_or_edit
    if action_name == 'new' || action_name == 'create'
      admin_users_path
    elsif action_name == 'edit'
      admin_user_path
    end
  end

end
