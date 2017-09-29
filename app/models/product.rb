class Product < ActiveRecord::Base
    has_many:batches,  dependent: :destroy, counter_cache: :true
    has_many:sales, through: :batches
    validates_presence_of :name, :productID, :description, :price
    self.primary_key = "productID"
    
end
