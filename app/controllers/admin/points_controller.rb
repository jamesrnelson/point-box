# Defines Admin's rights for the PointsController
class Admin::PointsController < Admin::BaseController
  def index

  end

  def new
    @users = User.all
    @point = Point.new
  end
end
