class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id:false do |t|
      t.integer :productID, null: false
      t.string :name
      t.string :description
      t.float :price

      t.timestamps null: false
    end
    add_index :products, :productID, unique: true
  end
end
