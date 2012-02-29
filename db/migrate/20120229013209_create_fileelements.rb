class CreateFileelements < ActiveRecord::Migration
  def change
    create_table :fileelements do |t|
      t.string :filename
      t.string :content_type
      t.binary :data

      t.timestamps
    end
  end
end
