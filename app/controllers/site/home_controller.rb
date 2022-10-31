# frozen_string_literal: true

module Site
  class HomeController < SiteController
    def index
      @categories = Category.order_by_description
      @ads = Ad.descending_order(16)
    end
  end
end
