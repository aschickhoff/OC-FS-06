class ApplicationController < ActionController::Base
  include ActivitiesHelper
  after_action :store_location
  before_action :authenticate_user!, except: [:index, :about]

  rescue_from NoMethodError, with: :handle_no_method_error

  private

  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || user_path(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def handle_no_method_error
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

end

