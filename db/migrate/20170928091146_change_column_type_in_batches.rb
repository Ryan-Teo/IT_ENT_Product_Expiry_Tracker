class ChangeColumnTypeInBatches < ActiveRecord::Migration
  def change
    change_column:batches , :product_id, :string
  end
end
