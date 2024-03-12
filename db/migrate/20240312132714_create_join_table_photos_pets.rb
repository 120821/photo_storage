class CreateJoinTablePhotosPets < ActiveRecord::Migration[7.0]
  def change
    create_join_table :photos, :pets do |t|
      # t.index [:photo_id, :pet_id]
      # t.index [:pet_id, :photo_id]
    end
  end
end
