class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to backoffice_admins_path, notice: 'Administrator successfuly created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if password_blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    if @admin.update(admin_params)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: 'Administrator successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: 'Administrator successfuly deleted.'
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(policy(@admin).permitted_attributes)
  end

  def password_blank?
    params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
  end
end

