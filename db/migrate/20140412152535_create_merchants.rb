class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :address
      t.string :name
      t.timestamps
    end

    add_index :merchants, [:address, :name]
  end
end
