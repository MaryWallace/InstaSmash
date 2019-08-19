# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
