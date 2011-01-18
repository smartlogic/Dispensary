class BuildsController < ApplicationController
  respond_to :html

  expose(:app)
  expose(:build)

  def create
    build.app_id = app.id
    if build.save
      flash[:notice] = "Build Added!"
      respond_with(app, build)
    else
      render :new
    end
  end

  def download
    send_file build.binary.path
  end
end
