class ModifyActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :preferred_age
    add_column :activities, :preferred_age_from, :integer
    add_column :activities, :preferred_age_to, :integer
  end
end
