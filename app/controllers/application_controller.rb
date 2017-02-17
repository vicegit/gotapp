class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to :back, :alert => exception.message
    #flash[:error] = "Access denied!"
    #flash.now[:alert] = exception.message
    #redirect_to dashboard_index_path, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

end
