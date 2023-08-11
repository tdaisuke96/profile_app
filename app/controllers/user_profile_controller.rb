class UserProfileController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    redirect_to(controller: 'profile_pages', action: 'show', id: @user.id)
  end
  
  private
    def user_params
      params.require(:user).permit(:self_introduction, :profile_image)
    end
end
