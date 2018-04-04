# Defines RewardsController Actions
class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to admin_rewards_path
    else
      redirect_to new_admin_reward_path
    end
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params)
    redirect_to admin_rewards_path
  end

  def destroy
    Reward.destroy(params[:id])
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:title, :description)
  end
end
