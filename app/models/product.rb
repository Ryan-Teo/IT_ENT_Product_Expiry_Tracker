class Product < ActiveRecord::Base
    has_many:batches,  dependent: :destroy
end
