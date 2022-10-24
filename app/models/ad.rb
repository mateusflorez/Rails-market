# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  # paperclip
  has_attached_file :picture, styles: { medium: "450x300", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  # money rails
  monetize :price_cents
end
