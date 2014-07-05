class RemoveChainFromCoffeespots < ActiveRecord::Migration
  def change
    remove_column :coffeespots, :chain, :boolean
  end
end
