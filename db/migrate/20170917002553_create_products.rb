class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products, id: false, :primary_key => 'productID') do |t|
      t.string :productID, null: false
      t.string :name
      t.string :description
      t.float :price

      t.timestamps null: false
    end
  end
end
