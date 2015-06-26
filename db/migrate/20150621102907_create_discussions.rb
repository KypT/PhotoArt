class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :about
      t.integer :entity_id

      t.timestamps null: false
    end
  end
end
