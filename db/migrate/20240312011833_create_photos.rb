class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :filename
      t.string :tags
      t.text :description
      t.datetime :upload_time
      t.string :location

      t.timestamps
    end
  end
end
