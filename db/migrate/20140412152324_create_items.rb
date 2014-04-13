class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price, precision: 8, scale: 2, null: false, default: 0
      t.timestamps
    end

    add_index :items, [:description, :price]
  end
end
