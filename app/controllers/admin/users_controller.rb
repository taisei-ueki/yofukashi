class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
      flash[:notice] = '会員情報が更新されました。'
    else
      render :edit
      flash[:alert] = "会員情報が更新されませんでした"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:email,:is_deleted)
  end
end
