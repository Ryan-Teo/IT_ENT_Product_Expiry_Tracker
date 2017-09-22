class CreateSales < ActiveRecord::Migration
  def change
    create_table(:sales, id: false, :primary_key => 'saleID') do |t|
      t.string :saleID, null: false
      t.integer :batchID
      t.float :salePrice
      t.date :saleStartDate
      t.date :saleEndDate

      t.timestamps null: false
    end
  end
   
end
