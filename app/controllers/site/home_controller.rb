class Site::HomeController < ApplicationController
  layout 'site'

  def index
    @categories = Category.order(:description)
    @ads = Ad.limit(8).order(created_at: :desc)
  end
end
