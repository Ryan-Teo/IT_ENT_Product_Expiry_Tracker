class AddTwoSignificantFiguresToPrice < ActiveRecord::Migration
  def change
    change_column :products, :price, :float, precision: 5, scale: 2
  end
end
