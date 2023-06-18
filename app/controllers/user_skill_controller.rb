class UserSkillController < ApplicationController
  def show
    # リクエストを受け取った時の処理＝/user_skill/1でリクエストされた時の処理
    @user = User.find(params[:id])
    #@user_id = User.find(1)
    puts('user_skill  show!!!!!-------')
    puts(@user.to_json)
    puts('-----------------')
    
    
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id:params[:id])
    puts('user_skill-------')
    puts(@user_skills.to_json)
    puts('-----------------')

    @skill_categories = SkillCategory.all
    puts('skill_category-------')
    puts(@skill_categories.to_json)
    puts('-----------------')
    
  end
  def edit
  end
end
