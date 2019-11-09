class Api::BelongsController < ApplicationController

  def index
    users = User.all
    belonged_users = current_organization.users
    render json: {
      users: users,
      belonged_users: belonged_users, 
      organization: current_organization
    }
  end

  def create
    user = User.find(belong_params[:user_id])
    organization = Organization.find(belong_params[:organization_id])
    BelongMailer.invite_mail(user, organization).deliver_now
    head :created
  end

  private

  def belong_params
    params.require(:belong).permit(:user_id, :organization_id)
  end
end
