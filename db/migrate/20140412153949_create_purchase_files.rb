class CreatePurchaseFiles < ActiveRecord::Migration
  def change
    create_table :purchase_files do |t|
      t.string :filename, null: false
      t.string :data_file
      t.decimal :gross_revenue, precision: 8, scale: 2, null: false, default: 0
      t.timestamps
    end
  end
end
