class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :description
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
