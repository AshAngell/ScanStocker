class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :size, null: false, foreign_key: true
      t.string :ref_id, null: false
      t.integer :quantity, null: false, default: 0
      t.timestamps
    end

    add_index :cart_items, [:ref_id, :size_id], unique: true
  end
end
