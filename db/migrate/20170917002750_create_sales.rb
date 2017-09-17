class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :saleID
      t.int :batchID
      t.float :salePrice
      t.date :saleStartDate
      t.date :saleEndDate

      t.timestamps null: false
    end
  end
end
