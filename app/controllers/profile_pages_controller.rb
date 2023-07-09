class ProfilePagesController < ApplicationController
  #このコントローラーでは表示だけ行う
  #自己紹介をモデルから取ってくる、スキルを持ってくる
  #チャート表示、自己紹介文、画像の表示
  #　→モデルからデータを持ってきて、ビューに渡す。
  
  
  # 未ログインページ用に要修正
  def index
    @user = User.find(1)
    
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id: 1)
    puts('debug info-------')
    puts(@user_skills.to_json)
    puts('-----------------')
  end
  
  def show
    @user = User.find(1)
    @user_id = @user.id
    puts('show!!!!!-------')
    puts(@user_id.to_json)
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id: 1)
    puts('debug info-------')
    puts(@user_skills.to_json)
    puts('-----------------')
    # send_image
  end
  
  # 画像表示用のメソッド
  def send_image
    @user = User.find(params[:id])
    if (@user.profile_image.size > 0)
      send_data(@user.profile_image, :disposition => 'inline')
    end
  end

=begin
  def profile_edit_page
    redirect_to '/user_profile/index'
  end
=end
  def skill_edit
  end
  
end
