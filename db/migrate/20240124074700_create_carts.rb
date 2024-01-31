class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :cartable_id
      t.string :cartable_type

      t.timestamps
    end
  end
end
