class UserProfileController < ApplicationController
  def index
    @self_introduction = User.find(1)
    @user = User.find(1)
    puts('self_introduction-------')
    puts(@self_introduction.to_json)
    puts('-----------------')
  end
  def show
    
  end
  def update
    #@self_introduction = User.find(1)
    puts('params check------------')
    puts(params[:self_introduction])
    @user.update(user_params)
    #param[:self_introduction]でデータを受け取ることはできたが更新されていない
    #さらに、更新処理も要検討
#    @self_introduction.Update(params[:self_introduction])
  end
  
  private
    def user_params
      params.require(:user).permit(:self_introduction)
    end
end
