class FileelementsAddModel < ActiveRecord::Migration
  def up
    add_column :fileelements, :model, :string
  end

  def down
    remove_column :fileelements, :model, :string
  end
end
