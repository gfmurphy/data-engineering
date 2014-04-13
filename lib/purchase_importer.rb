class PurchaseImporter
  attr_reader :gross_sales

  def initialize(purchase_file)
    @purchase_file = purchase_file
    @cache = {}
  end

  def import(&b)
    Purchase.transaction do
      yield self if block_given?
      @purchase_file.save!
    end
  end

  def <<(row)
    row = row.symbolize_keys
    item      = find_item(row.fetch(:item))
    merchant  = find_merchant(row.fetch(:merchant))
    purchaser = find_purchaser(row.fetch(:purchaser))

    @purchase_file.purchases.build(item: item, merchant: merchant,
      purchaser: purchaser, item_count: row.fetch(:item_count)).tap { |p|
      @purchase_file.gross_revenue += p.total
    }
  end

  private
  def find_item(item)
    @cache[cache_key("item", item)] ||= Item.find_or_create_by(item)
  end

  def find_merchant(merchant)
    @cache[cache_key("merchant", merchant)] ||= Merchant.find_or_create_by(merchant)
  end

  def find_purchaser(purchaser)
    @cache[cache_key("purchaser", purchaser)] ||= Purchaser.find_or_create_by(purchaser)
  end

  def cache_key(prefix, item)
    (Array(prefix) + item.values).join(":")
  end
end
