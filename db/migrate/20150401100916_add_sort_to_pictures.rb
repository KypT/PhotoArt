class AddSortToPictures < ActiveRecord::Migration
  def change
    add_column :photos, :sort, :integer
  end
end
