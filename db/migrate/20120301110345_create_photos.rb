class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.string :content_type
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
