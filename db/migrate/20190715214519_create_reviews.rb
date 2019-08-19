# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user_profile, null: false, index: true, foreign_key: true
      t.belongs_to :restaurant, null: false, index: true, foreign_key: true
      t.text :comment, null: false
      t.integer :rating

      t.timestamps
    end
  end
end
