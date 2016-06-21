class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, fb_uid, :string
    add_column :users, fb_token, :string
  end

  add_index :users, :fb_uid
end
