# frozen_string_literal: true

module Site
  class AdDetailController < SiteController
    def show
      @ad = Ad.find(params[:id])
      @ads = Ad.descending_order(4)
    end
  end
end
