class ProfilePagesController < ApplicationController
  before_action :logged_in_user, only:[:show]
  before_action :clear_flash
  #このコントローラーでは表示だけ行う
  #自己紹介をモデルから取ってくる、スキルを持ってくる
  #チャート表示、自己紹介文、画像の表示
  #　→モデルからデータを持ってきて、ビューに渡す。
  
  
  # 未ログインページ用に要修正
  def index
    months = [2.months.ago, 1.months.ago, Time.now]
    data = {}
    months.each do |month|
      data[month.to_date.strftime('%B')] = 0
    end
    puts("                      ")
    puts("初期データ")
    puts(@data.to_json)
    gon.data = data
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
    months = [2.months.ago, 1.months.ago, Time.now]

    # バックエンド、フロントエンド、インフラの3種類のスキルカテゴリーIDを取得
    backend_category_id = SkillCategory.find_by(skill_category: 'バックエンド').id
    frontend_category_id = SkillCategory.find_by(skill_category: 'フロントエンド').id
    infra_category_id = SkillCategory.find_by(skill_category: 'インフラ').id

    # スキルカテゴリーごとに更新値の合計を計算
    # xx_data = {"June"=>0, "July"=>0.7e2, "August"=>0.6e2}
    @backend_data = total_update_skill_level(backend_category_id, months)
    @frontend_data = total_update_skill_level(frontend_category_id, months)
    @infra_data = total_update_skill_level(infra_category_id, months)
    gon.backend_data = @backend_data
    gon.frontend_data = @frontend_data
    gon.infra_data = @infra_data
  end

  # 月ごとのスキル最終更新値の合計を計算するメソッド
  # 戻り値：xx_data = {"June"=>0, "July"=>50, "August"=>100}
  def total_update_skill_level(category_id, months)
    total_updated_level = {}
    # returnの初期化
    months.each do |month|
      total_updated_level[month.to_date.strftime('%B')] = 0
    end
      
    category_skills = @user_skills.where(skill_category_id: category_id)
    
    puts("****************************")
    # puts(start_date.all_month)
    puts(category_skills.to_json)
    puts("****************************")


    category_skills.each do |skill|
      # skillDetailのIDをキーに履歴テーブルから該当スキルの全データを取得
      skill_history = UpdateSkillHistory.where(skill_detail_id: skill.id)
      puts("skill_h!!!!!!!!   "+skill.skill_name+"  !!!!!!!!!!!!")
      puts(skill_history.to_json)
      puts("-----------------")
      # 1スキルに対して月ごとの最終更新値をもとめ、月の合計値に加算していく
      months.each do |month|
        # その月に作成された履歴データを全て取得
        monthly_skill_list = skill_history.where(created_at: month.all_month)
        # その月の最終更新レコード
        last_updated_history = monthly_skill_list.order(created_at: :desc).first
        puts("==========  "+ month.to_date.strftime('%B') +"月  ==========")
        puts(monthly_skill_list.to_json)
        puts("        &         ")
        puts(last_updated_history.to_json)
        # その月の最終更新レコードがnilじゃなければ月の合計更新レベルに加算していく
        unless last_updated_history.nil?
          total_updated_level[month.to_date.strftime('%B')] += last_updated_history.skill_level
        else
          # その月の更新がなければ、過去の最終更新レコードを取得
          unless skill_history.where("created_at <= ?",month.end_of_month).order(created_at: :desc).first.nil?
            # レコードがあればその月の合計値に加算
            total_updated_level[month.to_date.strftime('%B')] += skill_history.where("created_at <= ?",month.end_of_month).order(created_at: :desc).first.skill_level
          end
          # 下記デバッグ用
          # 全履歴から最終更新値を取得（未来月まで含めちゃう）
          puts(month.to_date.strftime('%B')+"に更新ないよ＊＊＊＊＊＊＊＊＊"+skill_history.order(created_at: :desc).first.skill_level.to_s)
          # puts(month.end_of_month)
          puts(skill_history.where("created_at <= ?",month.end_of_month).order(created_at: :desc).first.to_json)
          puts("************")
        end
      end
    end
    puts("")
    puts("+++++++++++++++++++++++. return.  +++++++++++++++++++++")
    puts(total_updated_level.to_json)
    total_updated_level
  end
  
  # 画像表示用のメソッド
  def send_image
    @user = User.find(params[:id])
    if (@user.profile_image.size > 0)
      send_data(@user.profile_image, :disposition => 'inline')
    end
  end

  def skill_edit
  end
  
end
