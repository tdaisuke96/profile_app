class UserSkillController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    puts('create!!!')
    puts('end')
  end
  
  def show
    # リクエストを受け取った時の処理＝/user_skill/1でリクエストされた時の処理
    @user = User.find(params[:id])
    #@user_id = User.find(1)
    
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
    @user = User.find(params[:id])
    #@user_id = User.find(1)
    
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id:params[:id])
    @skill_categories = SkillCategory.all
  end
  
  def update
    puts('save!!!')
    p params
    # puts(skill_params[:skill_name])
    puts('------------')
    # @user_skills = SkillDetail.where(user_id:params[:id])
    # @skill = skill_params(:skill_level)
    puts('skill--------------')
    # puts(@skill)
    # 下記元々
    # @skill = SkillDetail.find(skill_params[:id])
    @skill = SkillDetail.find(params[:id])
    puts(@skill.to_json)
    # puts(skill_params[:skill_level])
    # puts(params[:id].to_json)
    # 下記元々
    # @skill.update(skill_params)
    @skill.update(skill_level: params[:skill_level])
    render json: { success: true }
  end
  
  def destroy
    @skill =SkillDetail.find(params[:id])
    puts('destroy!!!!!!!!')
    puts(@skill.to_json)
    puts('------------')
    @skill.destroy
    redirect_to root_path
  end
  
  private 
    def skill_params
      params.require(:skill_detail).permit(:skill_level, :skill_name, :id)
    end

end
