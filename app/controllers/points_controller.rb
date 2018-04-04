# Defines actions for Points Controller
class PointsController < ApplicationController
  def index
    @points = current_user.points
  end

  def create
    Point.create(point_params)
    flash.notice = 'You have acquired a reward!'
    redirect_to rewards_path
  end

  private

  def point_params
    params.require(:point).permit(:value, :description, :user_id)
  end
end
