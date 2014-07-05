class AddChainToCoffeespots < ActiveRecord::Migration
  def change
    add_column :coffeespots, :chain, :boolean
  end
end
