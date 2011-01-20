class OrganizationsController < ApplicationController
  respond_to :html

  expose(:organization) 
  expose(:organizations) {current_user.organizations}

  def create
    organization.owner = current_user
    if organization.save
      flash[:notice] = 'Successfully created organization'
      respond_with(organization)
    else
      render :new
    end
  end
end
