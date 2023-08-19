class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  def logged_in_user
    unless logged_in?
      redirect_to login_path
    end
  end
  
  def clear_flash
    unless flash.nil?
      flash.clear
    end
  end
end
