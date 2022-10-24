class Ad < ApplicationRecord
  belongs_to :member
  belongs_to :category

  #money rails
  monetize :price_cents
end
