class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone, :string
    add_column :restaurants, :yelp_url, :string
    add_column :restaurants, :rating_count, :integer
  end
end
