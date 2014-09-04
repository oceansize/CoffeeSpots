class AddColumnToCoffeespots < ActiveRecord::Migration
  def change
    add_column :coffeespots, :user_id, :integer
  end
end
