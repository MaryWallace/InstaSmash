# frozen_string_literal: true

class User < ApplicationRecord
  has_one :user_profile, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :first_name,
                        :last_name,
                        on: %i[create update]
end
