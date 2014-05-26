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
end
