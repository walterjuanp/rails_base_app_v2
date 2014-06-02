module Admin::BaseHelper
  #
  # This basically calls render_breadcrumbs (from breadcrumbs_on_rails gem) 
  # with BootstrapBreadcrumbsBuilder builder some custom CSS and tags
  #
  def render_tws_breadcrumbs
    render_breadcrumbs :builder => ::BootstrapBreadcrumbsBuilder
  end

  #
  # This methoc call paginate with 'view_prefix' option overwrited
  # Also this check for empty ransack params
  #
  def tws_pagination model
    ransack_params = params[:q]
    ransack_params = nil if ransack_params.blank?
    paginate model, :theme => 'admin', params: { q: ransack_params }
  end
end
