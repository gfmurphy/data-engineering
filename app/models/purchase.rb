class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant
  belongs_to :purchase_file

  delegate :price, to: :item, prefix: true

  def total
    item_price * item_count
  end
end
