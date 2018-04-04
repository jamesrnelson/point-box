# Defines actions for Points Controller
class PointsController < ApplicationController
  def index
    @points = current_user.points
  end

  def create
    Point.create(point_params)
    UserReward.create(user_reward_params)
    flash.notice = 'You have acquired a reward!'
    redirect_to rewards_path
  end

  private

  def point_params
    params.require(:point).permit(:value, :description, :user_id)
  end

  def user_reward_params
    params.require(:user_reward).permit(:user_id, :reward_id)
  end
end
