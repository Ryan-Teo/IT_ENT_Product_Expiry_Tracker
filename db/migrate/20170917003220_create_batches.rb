class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer :batchID
      t.integer :productID
      t.integer :quantity
      t.date :expiryDate

      t.timestamps null: false
    end
  end
end
