class RemoveFacebookOnUser < ActiveRecord::Migration
  def change
    remove_column :users, :access_token, :string
    remove_column :users, :uid, :string
  end
end
