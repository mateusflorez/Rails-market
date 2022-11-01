# frozen_string_literal: true

module Site
  class HomeController < SiteController
    def index
      @ads = Ad.descending_order(16)
    end
  end
end
