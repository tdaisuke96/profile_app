class UserSkillController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :logged_in_user, only:[:new, :create, :edit, :update, :destroy]

  def new
    @user = User.find(params[:id])
    puts('new!!!')
    @category = SkillCategory.find(params[:category_id])
    puts(@category.to_json)
    @skill = SkillDetail.new
    
  end

  def create
    puts('create!!!')
    
    # p params
    # # @skill = SkillDetail.new
    # puts('end')
    puts('category')
    @category = SkillCategory.find(params[:category_id])
    puts(@category.id)
    puts('user')
    @user = User.find(params[:id])
    puts(@user.id)
    
    puts("skill_name & skill_level")
    # puts(params[:skill_name, :skill_level])
    # puts(params[:skill_level])

    create_params = {}
    create_params[:id] = SkillDetail.pluck(:id).max + 1
    create_params[:skill_name] = params[:skill_name]
    create_params[:skill_level] = params[:skill_level]
    @skill = @category.skill_details.build(create_params)
    @skill.user = @user
    @skill.save




    # # skill_categoryで設定したhas_manyの値をbuild
    # @skill = @category.skill_details.build(skill_params)
    # puts(@skill.to_json)
    # # skillに紐づくuser指定
    # @skill.user = @user
    # puts(@skill.to_json)
    # @skill.save
    render json: { success: true }

  end
  
  # def show
  #   # リクエストを受け取った時の処理＝/user_skill/1でリクエストされた時の処理
  #   @user = User.find(params[:id])
  #   #@user_id = User.find(1)
    
  #   #一時的にスキルだけ格納
  #   #カテゴリごとに配列に格納できるように後で修正
  #   @user_skills = SkillDetail.where(user_id:params[:id])
  #   puts('user_skill-------')
  #   puts(@user_skills.to_json)
  #   puts('-----------------')

  #   @skill_categories = SkillCategory.all
  #   puts('skill_category-------')
  #   puts(@skill_categories.to_json)
  #   puts('-----------------')
    
  # end
  def edit
    puts("edit!!!!!!!!!!!!!")
    p params
    puts(params[:modal])
    # 下記if文不要？
    # if params[:modal]
    #   redirect_to(user_skill_edit)
    # end
    @user = User.find(params[:id])
    
    #一��的にスキルだけ格納
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
    
    # **:idでURLからID取得も可能！！
    
    @skill = SkillDetail.find(params[:skill_id])
    puts(@skill.to_json)
    # puts(skill_params[:skill_level])
    # puts(params[:id].to_json)
    # 下記元々
    # @skill.update(skill_params)
    @skill.update(skill_level: params[:skill_level])
    render json: { success: true }
  end
  
  def destroy
    @skill =SkillDetail.find(params[:skill_id])
    puts('destroy!!!!!!!!')
    puts(@skill.to_json)
    puts('------------')
    @skill.destroy
    # redirect_to root_path
    render json: { success: true }
  end
  
  private 
    def skill_params
      params.require(:skill_detail).permit(:skill_level, :skill_name, :id, :category_id)
    end
end
