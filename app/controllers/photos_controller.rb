class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "Photo was successfully uploaded."
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:filename, :tags, :description, :upload_time, :location)
  end
end
