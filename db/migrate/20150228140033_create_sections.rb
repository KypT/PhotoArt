class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
