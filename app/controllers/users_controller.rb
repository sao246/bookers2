class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book2 = Book.find(params[:id]) 
  end
  
  def edit
    @user = User.find(params[:id]) 
  end

  def index
    @users = User.all
    @book = Book.new

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
