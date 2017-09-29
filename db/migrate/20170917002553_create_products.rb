class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products, id: false, :primary_key => 'productID') do |t|
      t.string :productID, null: false, :limit => 8
      t.string :name
      t.string :description
      t.double :price

      t.timestamps null: false
    end
  end
end
