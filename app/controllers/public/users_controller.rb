class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path
    else
      render "edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:introduction,:email,:profile_image)
  end
end
