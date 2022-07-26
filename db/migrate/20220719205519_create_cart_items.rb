class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :product
      t.references :cart
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
