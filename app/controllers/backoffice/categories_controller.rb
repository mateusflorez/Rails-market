class Backoffice::CategoriesController < BackofficeController

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
  end

  private

  def category_params
    params.require(:category).permit(:description)
  end
end
