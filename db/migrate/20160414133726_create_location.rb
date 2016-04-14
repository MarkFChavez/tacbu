class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.column :city, :string

      t.timestamps
    end
  end
end
