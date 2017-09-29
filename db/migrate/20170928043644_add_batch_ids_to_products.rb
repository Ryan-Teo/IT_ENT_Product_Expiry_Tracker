class AddBatchIdsToProducts < ActiveRecord::Migration
  def change
     add_column :products, :batch_ids , :string
  end
end
