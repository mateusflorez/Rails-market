# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  # scopes
  scope :descending_order, ->(quantity = 8) { limit(quantity).order(created_at: :desc) }
  scope :member_ads, ->(member) { where(member: member) }

  # paperclip
  has_attached_file :picture, styles: { medium: '450x300#', thumb: '100x100>' },
                              default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

  # money rails
  monetize :price_cents
end
