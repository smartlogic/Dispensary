class AppsController < ApplicationController
  respond_to :html

  expose(:app)
  expose(:apps) {App.all}
  expose(:latest_build) { app.builds.last }
  
  def create
    if app.save
      flash[:notice] = "Successfully created #{app.name}"
      respond_with(app)
    else
      render :new
    end
  end

  def index
  end
end
