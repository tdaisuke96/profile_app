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
    puts('-----------------')
    
    
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id: 1)
    puts('debug info-------')
    puts(@user_skills.to_json)
    puts('-----------------')
  end

=begin
  def profile_edit_page
    redirect_to '/user_profile/index'
  end
=end
  def skill_edit
  end
  
end
