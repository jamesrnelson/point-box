# Defines user controller actions
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'Thanks for making an account! Log in now to see what all the fuss is about!'
      redirect_to login_path
    else
      flash.notice = 'Sorry--there was a problem! Please try again!'
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
