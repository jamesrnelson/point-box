# Defines Admin rights for RewardsController
class Admin::RewardsController < Admin::BaseController
  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def edit
    @reward = Reward.find(params[:id])
  end
end
