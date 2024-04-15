class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
