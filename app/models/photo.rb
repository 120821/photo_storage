class Photo < ApplicationRecord
  # 模型关联
  # 这里可以添加与其他模型的关联关系，如用户表等
  # 暂时不使用用户

  # 模型验证
  validates :filename, presence: true
  validates :tags, presence: true
end
