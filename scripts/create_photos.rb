ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'open-uri'
require 'rubygems'
require 'json'
require 'httparty'
i = 1
loop do
  url = "https://api.likepoems.com/img/mc"
  # 把图片保存在本地
  `wget #{url} --output-document=./public/uploads/image#{i}.jpg`
  # 预定义一些标签
  chinese_characters = ['可爱', '萌萌哒', '喵喵', '汪汪', '快乐', '温柔', '美丽', '梦幻', '独特', '幸福']
  # 随机选择一个汉字作为标签
  # 定义tag和对应的描述映射
  tag_descriptions = {
    '可爱' => '这是一张可爱的照片。',
    '萌萌哒' => '这张照片萌萌哒，充满了童趣。',
    '喵喵' => '一只可爱的猫咪在照片中呈现出它的优雅。',
    '汪汪' => '一只活泼可爱的小狗在照片中展现了它的快乐。',
    '快乐' => '这张照片充满了快乐和笑声。',
    '温柔' => '照片中的景象给人一种温柔和宁静的感觉。',
    '美丽' => '这是一张美丽的照片，令人陶醉。',
    '梦幻' => '这张照片的色彩梦幻般，给人一种超现实的感觉。',
    '独特' => '这张照片展现了独特的景象，让人过目不忘。',
    '幸福' => '这张照片中的场景充满了幸福和满足的感觉。'
  }

  tag = chinese_characters.sample
  description = tag_descriptions[tag]
  location = "public/uploads/image#{i}.jpg"
  #location.force_encoding('UTF-8')
  #image_data = open(location) { |f| f.read }
  image_data = File.open(location)
  #image_data.force_encoding('UTF-8')
  Photo.create filename: "image#{i}", tags: tag, description: description, upload_time: Time.now, location: location, created_at: Time.now, updated_at: Time.now, image_url: url, image_data: image_data
  i = i+1
  if i >1000
    break
  end
end
