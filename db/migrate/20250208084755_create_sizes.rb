class CreateSizes < ActiveRecord::Migration[8.0]
  def change
    create_table :sizes do |t|
      t.references :item
      t.integer :amount
      t.timestamps
    end
  end
end
