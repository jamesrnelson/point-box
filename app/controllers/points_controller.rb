# Defines actions for Points Controller
class PointsController < ApplicationController
  def create
    @point = Point.create(point_params)
    if @point.save
      redirect_to admin_points_path
    else
      flash.notice = 'You must select a point value.'
      redirect_to new_admin_point_path
    end
  end

  private

  def point_params
    params.require(:point).permit(:value, :user_id)
  end
end
