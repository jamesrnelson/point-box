# Defines Admin UsersController
class Admin::UsersController < Admin::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to admin_users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
