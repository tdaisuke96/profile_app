class UserProfileController < ApplicationController
  def index
    @self_introduction = User.find(1)
    puts('self_introduction-------')
    puts(@self_introduction.to_json)
    puts('-----------------')
  end
  def update
    puts('params check------------')
    puts(params[:self_introduction])
    #param[:self_introduction]でデータを受け取ることはできたが更新されていない
    #さらに、更新処理も要検討
#    @self_introduction.Update(params[:self_introduction])
  end
end
