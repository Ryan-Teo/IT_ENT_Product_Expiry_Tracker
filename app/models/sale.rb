class Sale < ActiveRecord::Base
    self.primary_key = "saleID"
    has_many:batches,dependent: :destroy
    has_many:products, through: :batches
end
