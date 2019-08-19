# frozen_string_literal: true

class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.float :longitude
      t.float :latitude
      t.string :phone
      t.string :rating

      t.timestamps
    end
  end
end
