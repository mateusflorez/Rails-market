# frozen_string_literal: true

module Site
  class HomeController < ApplicationController
    layout 'site'

    def index
      @categories = Category.order(:description)
      @ads = Ad.limit(8).order(created_at: :desc)
    end
  end
end
