# frozen_string_literal: true

module Site
  class HomeController < SiteController
    def index
      @ads = Ad.descending_order(16)
      @categories = Category.order_by_description
    end
  end
end
