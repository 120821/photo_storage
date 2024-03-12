require 'image_uploader'
class Photo < ApplicationRecord
  has_and_belongs_to_many :pets
  mount_uploader :image_data, ImageUploader
  # 这里可以添加与其他模型的关联关系，如用户表等
  # 暂时不使用用户

  # 模型验证
  validates :filename, presence: true
  validates :tags, presence: true
  before_save :process_image

  # 把上传的图像转换为缩略图，并使用 MiniMagick 作为图像处理工具
  def process_image
    if image.present?
      image.thumb('100x100') do |thumb|
        self.image = thumb if thumb.present?
      end
    end
  end
end
