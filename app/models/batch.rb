class Batch < ActiveRecord::Base
    self.primary_key = "batchID"
    belongs_to:sale
    belongs_to:product
end
