class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    puts("----session create----")
    @user = User.find_by(email: params[:session][:email].downcase)
    
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      puts("log-------------")
      # puts(@user.to_json)
      redirect_to(controller: 'profile_pages', action: 'show', id: @user.id)
    else
      message = "ログインに失敗しました。メールアドレスまたはパスワードが間違っています。"
      flash[:warning] = message
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
