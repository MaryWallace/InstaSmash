# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :reviews
end
