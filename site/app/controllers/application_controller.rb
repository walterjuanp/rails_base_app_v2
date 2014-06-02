class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #
  # Overwrite method from devise
  #
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      stored_location_for(resource) || admin_path
    elsif resource.is_a?(User)
      stored_location_for(resource) || private_path
    else
      super
    end
  end

  #
  # Overwrite method from devise
  #
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin) || resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope.is_a?(User) || resource_or_scope == :user
      new_user_session_path
    else
      super
    end
  end
end
