class Product < ActiveRecord::Base
    has_many:batches,  dependent: :destroy
    has_many:sales, through: :batches
    self.primary_key = "productID"
end
