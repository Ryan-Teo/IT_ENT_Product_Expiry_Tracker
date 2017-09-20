class ChangeAllPrimaryKeysIntoString < ActiveRecord::Migration
  def up
    change_column :products, :productID, :string
    change_column :batches, :batchID, :string
    change_column :sales, :saleID, :string
  end

  def down
    change_column :products, :productID, :string
    change_column :sales, :saleID, :string
    change_column :batches, :batchID, :string
  end
end
