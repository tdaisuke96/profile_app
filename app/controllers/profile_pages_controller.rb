class ProfilePagesController < ApplicationController
  #このコントローラーでは表示だけ行う
  #自己紹介をモデルから取ってくる、スキルを持ってくる
  #チャート表示、自己紹介文、画像の表示
  #　→モデルからデータを持ってきて、ビューに渡す。
  def index
    @user = User.find(1)
    #ユーザーのスキルは複数なので配列に格納する必要あり
    # tutorial参考にできるかも
    @user_skills = SkillDetail.find_by(user_id: 1)
    puts(@user_skills)
  end

=begin
  def profile_edit_page
    redirect_to '/user_profile/index'
  end
=end
  def skill_edit
  end
  
end
