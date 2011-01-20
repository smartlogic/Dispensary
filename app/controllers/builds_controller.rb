Mime::Type.register "text/xml", :plist

class BuildsController < ApplicationController
  respond_to :html, :plist

  expose(:organization)
  expose(:app)
  expose(:build)

  def create
    build.app_id = app.id
    if build.save
      flash[:notice] = "Build Added!"
      redirect_to organization_app_path(organization, app)
    else
      render :new
    end
  end

  def download
    send_file build.bundle.path
  end
end
