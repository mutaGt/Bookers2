class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(current_user)
  else
    render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:profile_image, :introduction)
  end
  
  def corrent_user
    if current_user.id != params[:id].to_i
      redirect_to user_path("current_user")
    end
  end
end
