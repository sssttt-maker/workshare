class BelongsController < ApplicationController
  protect_from_forgery
  def index
    @users = User.all
  end

  def create
    @belong = Belong.new(belong_params)
    @belong.save!
    redirect_to root_url
  end

  private

  def belong_params
    params.require(:belong).permit(:user_id, :organization_id)
  end
end
