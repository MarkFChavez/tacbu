class CreateUserActivity < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
      t.column :activity_id, :integer
      t.column :user_id, :integer
      t.column :role, :string
      t.column :state, :string

      t.timestamps
    end

    add_index :user_activities, :activity_id
    add_index :user_activities, :user_id
  end
end
