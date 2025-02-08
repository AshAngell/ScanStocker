class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :name, null: false
      t.boolean :private, null: false, default: false
      t.string :barcode
      t.string :units
      t.timestamps
    end
  end
end
