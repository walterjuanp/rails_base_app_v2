
class Admin::ProfileController < Admin::BaseController
  add_breadcrumb "Profile", :admin_profile_path,      :only => %w(show edit update)
  add_breadcrumb "Edit",    :edit_admin_profile_path, :only => %w(edit update)

  def show
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = Admin.find(current_admin.id)
    if @admin.update_with_password(admin_params)
      # Sign in the admin by passing validation in case his password changed
      sign_in @admin, :bypass => true
      redirect_to admin_profile_path
    else
      render "edit"
    end
  end

  private

  def admin_params
    # NOTE: Using `strong_parameters` gem
    params.required(:admin).permit(:password, :password_confirmation, :current_password)
  end

end