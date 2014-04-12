class PurchaseFile < ActiveRecord::Base
  has_many :purchases, dependent: :destroy

  validates :filename, presence: true
end
