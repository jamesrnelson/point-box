# Defines Admin UsersController
class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
