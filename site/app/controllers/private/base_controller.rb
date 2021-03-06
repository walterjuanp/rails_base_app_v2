#
# Base controller used inside all 'private' module
#
class Private::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application_private'

  # Only admin users can access
  before_action :authenticate_user!
end