class AppsController < ApplicationController
  respond_to :html

  expose(:organization)
  expose(:app)
  expose(:apps) {App.all}
  
  def create
    if app.save
      flash[:notice] = "Successfully created #{app.name}"
      respond_with(organization, app)
    else
      render :new
    end
  end

  def index
  end
end
