class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales,id:false do |t|
      t.integer :saleID, null: false
      t.integer :batchID
      t.float :salePrice
      t.date :saleStartDate
      t.date :saleEndDate

      t.timestamps null: false
    end
    add_index :sales, :saleId, unique: true
  end
   
end
