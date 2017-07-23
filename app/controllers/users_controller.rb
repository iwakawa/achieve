class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #選択したユーザ
    @user = User.find(params[:id])
    #フォローワーとフォローしている人を調べるため
    @users = User.all
  end
end
