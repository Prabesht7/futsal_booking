class AddImageToShoppings < ActiveRecord::Migration[7.0]
  def change
    add_column :shoppings, :image, :string
  end
end
