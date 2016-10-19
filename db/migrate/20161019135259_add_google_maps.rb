class AddGoogleMaps < ActiveRecord::Migration
  def change
    add_column :restaurants, :google_url, :string
  end
end
