class ChangeMessageAuthor < ActiveRecord::Migration
  def change
    remove_column :messages, :author
    add_reference :messages, :user
  end
end
