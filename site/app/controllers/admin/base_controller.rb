#
# Base controller used inside all 'admin' module
#
class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application_admin'

  # Only admin users can access
  before_action :authenticate_admin!

end