class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :store_location

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
  
end
