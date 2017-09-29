class AddingReferenceToBatch < ActiveRecord::Migration
  def change
     add_reference :batches, :product, index: true
  end
end
