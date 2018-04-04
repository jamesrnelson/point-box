# Defines actions for Points Controller
class PointsController < ApplicationController
  def index
    @points = current_user.points
  end

  def create
    point = Point.create(point_params)
    if point.save
      redirect_to admin_points_path
    else
      flash.notice = 'You must select a point value.'
      redirect_to new_admin_point_path
    end
  end

  def destroy
    Point.destroy(params[:id])
    redirect_to admin_points_path
  end

  private

  def point_params
    params.require(:point).permit(:value, :description, :user_id)
  end
end
