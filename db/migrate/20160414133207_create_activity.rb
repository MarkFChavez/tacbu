class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.column :date_from, :datetime
      t.column :date_to, :datetime
      t.column :name, :string
      t.column :preferred_gender, :string
      t.column :preferred_age, :integer
      t.column :state, :string
      t.column :description, :text
      t.column :category_id, :integer
      t.column :location_id, :integer

      t.timestamps
    end

    add_index :activities, :category_id
    add_index :activities, :location_id
  end
end
