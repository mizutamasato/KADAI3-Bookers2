class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])#current_user
    @books = @user.books.all
  end

  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
  end

  def update
    @user = User.find(params[:id]) # current_user#
    if @user.update(user_params)
      flash[:notice] = "succcessfully!!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image , :introduction)
  end
end
