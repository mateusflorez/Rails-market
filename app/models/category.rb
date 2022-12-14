# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :ads

  validates_presence_of :description

  # scopes
  scope :order_by_description, -> { order(:description) }
end
