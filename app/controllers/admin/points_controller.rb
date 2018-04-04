# Defines Admin's rights for the PointsController
class Admin::PointsController < Admin::BaseController
  def index
    @users = User.all
  end

  def new
    @users = User.alphabetize
    @point = Point.new
  end
end
