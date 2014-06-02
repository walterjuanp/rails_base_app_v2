
class Admin::AccountsController < Admin::BaseController

  add_breadcrumb "Accounts", :admin_accounts_path

  def index
    @users = User.limit(20).order('created_at DESC')
    @admins = Admin.limit(20).order('created_at DESC')
  end

end