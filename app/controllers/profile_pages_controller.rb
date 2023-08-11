class ProfilePagesController < ApplicationController
  before_action :logged_in_user, only:[:show]
  #このコントローラーでは表示だけ行う
  #自己紹介をモデルから取ってくる、スキルを持ってくる
  #チャート表示、自己紹介文、画像の表示
  #　→モデルからデータを持ってきて、ビューに渡す。
  
  
  # 未ログインページ用に要修正
  def index
  end
  
  def show
    @user = User.find_by(id: params[:id])
    # @user_id = @user.id
    puts('show!!!!!-------')
    # puts(@user_id.to_json)
    #一時的にスキルだけ格納
    #カテゴリごとに配列に格納できるように後で修正
    @user_skills = SkillDetail.where(user_id: params[:id])
    puts('debug info-------')
    # puts(@user_skills.to_json)
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
    @backend_data = calculate_average_skill_level(backend_category_id, start_date, end_date)
    @frontend_data = calculate_average_skill_level(frontend_category_id, start_date, end_date)
    @infra_data = calculate_average_skill_level(infra_category_id, start_date, end_date)

    gon.backend_data = @backend_data
    gon.frontend_data = @frontend_data
    gon.infra_data = @infra_data

    # ビューに渡すデータをまとめる
    @data = [
      { name: 'バックエンド', data: @backend_data },
      { name: 'フロントエンド', data: @frontend_data },
      { name: 'インフラ', data: @infra_data }
    ]
  end

  # private

  # スキルカテゴリーごとの各月の平均スキルレベルを計算するメソッド
  # 　＊＊＊下記仕様に要変更　＊＊＊
    # 各カテゴリのスキル(ユーザー)ごと（例：BE全てのスキル）に下記を実行
    # 1.過去３ヶ月分のデータを取得
    # 2.月毎に最終更新日を取得、その際のレベルを取得
    # 3.上記２を月毎に加算
    # 4.先々月のBE合計値、先月のBE合計値、今月のBE合計値のデータができる
    # ＊同様に他カテゴリも行う
    
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
