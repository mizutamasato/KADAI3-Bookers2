class UsersController < ApplicationController
  def edit
  end

  def show    
    @user = User.find(params[:id])#current_user
  end

  def index
    @users = User.all
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image , :introduction)
  end
end
