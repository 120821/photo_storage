class AddPetIdToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :pet_id, :integer
  end
end
