class BelongsController < ApplicationController
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
    params.require(:belong).permit(:use_id, :organization_id)
  end
end
