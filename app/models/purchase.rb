class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant
  belongs_to :purchase_file
end
