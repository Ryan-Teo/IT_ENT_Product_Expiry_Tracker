class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :productID
      t.string :name
      t.string :description
      t.float :price

      t.timestamps null: false
    end
  end
end
