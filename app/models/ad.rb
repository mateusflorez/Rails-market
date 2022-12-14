# frozen_string_literal: true

class Ad < ApplicationRecord
  # callbacks
  before_save :md_to_html

  # associations
  belongs_to :member
  belongs_to :category

  # validation
  validates :title, :description_md, :description_short, :category, :price, :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # scopes
  scope :descending_order, ->(quantity = 8) { limit(quantity).order(created_at: :desc) }
  scope :member_ads, ->(member) { where(member: member) }

  # paperclip
  has_attached_file :picture, styles: { large: '600x700#', medium: '450x300#', thumb: '100x100>' },
                              default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

  # money rails
  monetize :price_cents

  private

  def md_to_html
    options = {
      filter_html: true,
      link_attributes: {
        rel: 'nofollow',
        target: '_blank'
      }
    }

    extensions = {
      space_after_headers: true,
      autolink: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    self.description = markdown.render(description_md)
  end
end
