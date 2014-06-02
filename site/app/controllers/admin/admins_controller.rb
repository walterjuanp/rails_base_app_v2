
class Admin::AdminsController < Admin::BaseController
  before_filter :retrive_admin, :except => [:index, :new, :create]

  add_breadcrumb "Accounts",  :admin_accounts_path
  add_breadcrumb "Admins",    :admin_admins_path
  add_breadcrumb "Admin",     :admin_admin_path,      :only => %w(show edit update)
  add_breadcrumb "New",       :new_admin_admin_path,  :only => %w(new create)
  add_breadcrumb "Edit",      :edit_admin_admin_path, :only => %w(edit update)

  def index
    @q = Admin.search(params[:q])
    @admins = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new admin_params
    if @admin.save
      redirect_to admin_admin_path(@admin) 
    else
      render 'new'
    end
  end

  def update
    params_to_update = admin_params
    if params_to_update[:password].blank? && params_to_update[:password_confirmation].blank? 
      params_to_update.delete :password
      params_to_update.delete :password_confirmation
    end

    if @admin.update(params_to_update)
      redirect_to admin_admin_path(@admin)
    else
      render "edit"
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path
  end

  private
  def admin_params
    # NOTE: Using `strong_parameters` gem
    params.required(:admin).permit(:email, :password, :password_confirmation)
  end

  def retrive_admin
    @admin = Admin.find(params[:id])
  end

end