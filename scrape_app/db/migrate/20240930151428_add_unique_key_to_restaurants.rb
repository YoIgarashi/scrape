class AddUniqueKeyToRestaurants < ActiveRecord::Migration[7.2]
  def change
    add_column :restaurants, :unique_key, :string
  end
end
