class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_sections
  rescue_from Exception, :with => :error_500
  rescue_from ActionController::RoutingError, :with => :error_404

  def load_sections
    @sections = Section.all
  end

  protected
  def authenticate_admin!
    authenticate_user!
    not_found unless current_user.admin?
  end

  def error_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end


  def error_500
    render file: "#{Rails.root}/public/500.html", layout: false, status: 500
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
