# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates_presence_of :restaurant_id,
                        :user_id,
                        :comment,
                        :rating,
                        on: %i[create update]
end
