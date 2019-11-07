class OrganizationsController < ApplicationController
  def index
    @organizations = current_user.organizations
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
