class UserProfileController < ApplicationController
  #不要？
  def index
    @self_introduction = User.find(1)
    @user = User.find(1)
    puts('self_introduction-------')
    puts(@self_introduction.to_json)
    puts('-----------------')
  end
  
# showも画面表示用のメソッドだが使わず、editを使用??
  def show
    @self_introduction = User.find(params[:id])
    @user = User.find(params[:id])
    puts('self_introduction-------')
    puts(@self_introduction.to_json)
    puts('-----------------')
  end    

  def edit
    # @self_introduction = User.find(params[:id])
    @user = User.find(params[:id])
    # puts('self_introduction edit-------')
    # puts(@self_introduction.to_json)
    # puts('-----------------')
  end

  def update
    #@self_introduction = User.find(1)
    @user = User.find(params[:id])
    # puts(params[:selfIntroduction])
    # viewのパラメータをストロングパラメータ経由で取得
    profile_image = user_params[:profile_image]
    self_introduction = user_params[:self_introduction]
    puts('profile_image----')
    puts(profile_image)
    puts('---------------')
    # 更新用のハッシュを用意
    update_params = {}
    # key:valueでセット（self_introductionは必須）
    update_params[:self_introduction] = self_introduction
    if profile_image != nil
      # 上記作成したハッシュのkey:profile_imageに選択画像をバイナリ化して格納
      update_params[:profile_image] = profile_image.read
      puts('profile image not null!!!!')
    end
    @user.update(update_params)
    redirect_to root_path(@user)
  end
  
  private
    def user_params
      puts('strong params-------')
      puts(params.require(:user).permit(:self_introduction, :profile_image))
      puts('--------------------')
      params.require(:user).permit(:self_introduction, :profile_image)

    end
end
