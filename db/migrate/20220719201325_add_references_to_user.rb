class AddReferencesToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :user
    add_column :carts, :status, :string, default: "active"
  end
end
