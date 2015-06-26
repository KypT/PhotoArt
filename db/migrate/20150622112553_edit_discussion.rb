class EditDiscussion < ActiveRecord::Migration
  def change
    change_table :discussions do | t |
      t.remove  :about
      t.remove :entity_id
      t.references :discussable, polymorphic: true, index: true
    end
  end
end
