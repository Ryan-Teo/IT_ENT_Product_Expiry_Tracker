class RemoveUnusedColumnFromProducts < ActiveRecord::Migration
  def change
    remove_column :products , :batch_ids
  end
end
