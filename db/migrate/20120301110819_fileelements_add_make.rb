class FileelementsAddMake < ActiveRecord::Migration
  def up
    add_column :fileelements, :make, :string
  end

  def down
    remove_column :fileelements, :make
  end
end
