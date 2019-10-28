module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  #ログイン中のユーザーが新規登録画面に行かないようにする
  def logout_recommend
    if logged_in?
      flash[:danger] = "ログアウトしてください"
      redirect_to users_path
    end
  end

  #ログインユーザーと編集しようとしているユーザーのidが一致しない場合にアクセスを拒否
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end

  #ログインユーザーと編集しようとしている投稿のユーザーidが一致しない場合にアクセスを拒否
  def forbid_correct_user
    if current_user.id != @task.user.id
      flash[:notice] = "編集権限がありません"
      redirect_to tasks_path
    end
  end

  #ログアウト状態の時アクセス拒否
  def authenticate_user
    if current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to new_session_path
    end
  end

end
