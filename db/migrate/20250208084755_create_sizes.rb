class CreateSizes < ActiveRecord::Migration[8.0]
  def change
    create_table :sizes do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
