class WelcomeController < ApplicationController
  def index
    #flash[:alert] = "晚安！该睡了！"
    #flash[:notice] = "早上好！"
    flash[:warning] = "警告！"

  end
end
