# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  validate :email, presence: true
end
