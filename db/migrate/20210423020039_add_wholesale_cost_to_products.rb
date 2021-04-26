class AddWholesaleCostToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :wholesale_cost, :integer
  end
end
