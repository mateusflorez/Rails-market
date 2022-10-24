# frozen_string_literal: true

module Backoffice
  class CategoriesController < BackofficeController
    before_action :set_category, only: %i[edit update]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = CategoryService.create(category_params)

      if @category.errors.any?
        render :new
      else
        redirect_to backoffice_categories_path, notice: 'Category successfuly created.'
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to backoffice_categories_path, notice: 'Category successfuly updated.'
      else
        render :edit
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:description)
    end
  end
end
