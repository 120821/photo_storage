class RemovePetIdFromPhotos < ActiveRecord::Migration[7.0]
  def up
    remove_column :photos, :pet_id
  end
  def down
    add_column :photos, :pet_id, :int
  end
end
