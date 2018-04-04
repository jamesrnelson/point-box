# Defines Admin's rights for the PointsController
class Admin::PointsController < Admin::BaseController
  def index
    @users = User.all

  end

  def new
    @users = User.all
    @point = Point.new
  end

  def create
    point = Point.create(point_params)
    if point.save
      redirect_to admin_points_path
    else
      redirect_to new_admin_point_path
    end
  end

  private

  def point_params
    params.require(:point).permit(:value, :user_id)
  end
end
