module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログイン中のユーザーがいればユーザーを返却
  def current_user
    if session[:user_id]
      # find_byだと存在しない場合nilを返す
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # ログイン中のユーザーと受けとったユーザーを比較（return:true, false）
  def current_user?(user)
    user == current_user
  end
  
  # ユーザーログイン有無（return: true, false）
  def logged_in?
    !current_user.nil?
  end
  
  # ログアウト（cookieに保存されているuser_idを削除）
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
