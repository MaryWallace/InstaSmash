# frozen_string_literal: true

class Category < ApplicationRecord
  validates_presence_of :name
end
