class AddUrlToCoffeespots < ActiveRecord::Migration
  def change
    add_column :coffeespots, :url, :string
  end
end
