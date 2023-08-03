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

    # 3ヶ月前から現在までのデータを取得
    start_date = 2.months.ago
    end_date = Time.now

    # バックエンド、フロントエンド、インフラの3種類のスキルカテゴリーIDを取得
    backend_category_id = SkillCategory.find_by(skill_category: 'バックエンド').id
    frontend_category_id = SkillCategory.find_by(skill_category: 'フロントエンド').id
    infra_category_id = SkillCategory.find_by(skill_category: 'インフラ').id

    # スキルカテゴリーごとの各月の平均スキルレベルを計算
    backend_data = calculate_average_skill_level(backend_category_id, start_date, end_date)
    frontend_data = calculate_average_skill_level(frontend_category_id, start_date, end_date)
    infra_data = calculate_average_skill_level(infra_category_id, start_date, end_date)

    # ビューに渡すデータをまとめる
    @data = [
      { name: 'バックエンド', data: backend_data },
      { name: 'フロントエンド', data: frontend_data },
      { name: 'インフラ', data: infra_data }
    ]
  end

  # private

  # スキルカテゴリーごとの各月の平均スキルレベルを計算するメソッド
  def calculate_average_skill_level(category_id, start_date, end_date)
    data = {}
    (start_date.to_date..end_date.to_date).each do |date|
      # 各月の平均スキルレベルを計算
      average_level = SkillDetail.where(skill_category_id: category_id, created_at: date.all_month).average(:skill_level) || 0
      # 平均スキルレベルをデータに追加
      data[date.strftime('%B')] = average_level
    end
    data
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
