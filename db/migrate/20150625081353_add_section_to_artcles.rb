class AddSectionToArtcles < ActiveRecord::Migration
  def change
    add_column :articles, :section, :string
  end
end
