class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :purchaser
      t.belongs_to :item
      t.belongs_to :merchant
      t.integer :item_count, null: false, default: 0
      t.timestamps
    end

    add_index :purchases, :purchaser_id
    add_index :purchases, :item_id
    add_index :purchases, :merchant_id
  end
end
