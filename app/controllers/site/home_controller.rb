# frozen_string_literal: true

module Site
  class HomeController < ApplicationController
    layout 'site'

    def index
      @categories = Category.order_by_description
      @ads = Ad.last_eight
    end
  end
end
