class Pet < ApplicationRecord
  has_and_belongs_to_many :photos

  def all_photos
    photos
  end
end
