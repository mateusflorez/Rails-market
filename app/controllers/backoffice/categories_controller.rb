class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category successfuly created.'
      redirect_to backoffice_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category successfuly updated.'
      redirect_to backoffice_categories_path
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
