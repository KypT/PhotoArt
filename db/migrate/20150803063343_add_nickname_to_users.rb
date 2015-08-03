class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, default: '', unique: true
    add_column :users, :role, :string, default: 'user'
  end
end