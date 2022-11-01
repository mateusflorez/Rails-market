# frozen_string_literal: true

class SiteController < ApplicationController
  before_action :load_categories
  layout 'site'

  private

  def load_categories
    @categories = Category.order_by_description
  end
end
