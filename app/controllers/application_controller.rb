class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_sections

  def load_sections
    @sections = Section.all
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
