
class Admin::UsersController < Admin::BaseController
  before_filter :retrive_user, :except => [:index, :new, :create]

  add_breadcrumb "Accounts",  :admin_accounts_path
  add_breadcrumb "Users",     :admin_users_path
  add_breadcrumb "User",      :admin_user_path,      :only => %w(show edit update)
  add_breadcrumb "New",       :new_admin_user_path,  :only => %w(new create)
  add_breadcrumb "Edit",      :edit_admin_user_path, :only => %w(edit update)

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to admin_user_path(@user) 
    else
      render 'new'
    end
  end

  def update
    params_to_update = user_params
    if params_to_update[:password].blank? && params_to_update[:password_confirmation].blank? 
      params_to_update.delete :password
      params_to_update.delete :password_confirmation
    end

    if @user.update(params_to_update)
      redirect_to admin_user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.required(:user).permit(:email, :password, :password_confirmation, :confirmed_at)
  end

  def retrive_user
    @user = User.find(params[:id])
  end
end