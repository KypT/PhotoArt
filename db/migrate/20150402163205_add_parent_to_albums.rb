class AddParentToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :parent, :integer
  end
end
