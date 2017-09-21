class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches, id:false do |t|
      t.integer :batchID, null: false
      t.integer :productID, null: false
      t.integer :quantity
      t.date :expiryDate

      t.timestamps null: false
    end
    
  end
end
