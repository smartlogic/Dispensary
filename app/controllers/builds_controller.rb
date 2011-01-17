class BuildsController < ApplicationController
  respond_to :html

  expose(:app)
  expose(:build)

  def create
    if build.save
      flash[:notice] = "Build Added!"
      respond_with(app, build)
    else
      render :new
    end
  end
end
