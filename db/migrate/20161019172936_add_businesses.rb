class AddBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :rating
      t.integer :review_count
      t.string :address
      t.string :phone
      t.string :url
      t.string :yelp_id
    end
  end
end
