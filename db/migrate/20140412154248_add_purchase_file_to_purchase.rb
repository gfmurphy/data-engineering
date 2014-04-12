class AddPurchaseFileToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_file_id, :integer
    add_index :purchases, :purchase_file_id
  end
end
