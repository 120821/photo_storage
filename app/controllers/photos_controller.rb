class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.upload_time = Time.now
    @photo.location = save_uploaded_file(params[:photo][:image_data])

    if @photo.save
      redirect_to photos_path, notice: '图片上传成功！'
    else
      render :new
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:filename, :tags, :description, :upload_time, :location, :image_data)
  end

  def save_uploaded_file(uploaded_file)
    file_name = uploaded_file.original_filename
    file_path = Rails.root.join('public', 'uploads', file_name)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end
    file_path.relative_path_from(Rails.root.join('public'))
  end

end
