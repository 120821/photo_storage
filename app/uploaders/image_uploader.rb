class ImageUploader < CarrierWave::Uploader::Base
  # 上传文件保存的目录
  def store_dir
    'uploads/images'
  end

  # 允许上传的文件类型
  def extension_allowlist
    %w[jpg jpeg png webp gif tif tiff]
  end
end
