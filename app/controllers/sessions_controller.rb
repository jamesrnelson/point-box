class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else

    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to sessions_path
  end
end
