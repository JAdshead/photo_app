class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #before_filter :show_session
  #def show_session
   # logger.info "SESSION CONTAINS: #{user_session}"
  #end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url , alert: "You can't access this page"
  end

  # rescue_from  ThumbsUp::AccessDenied do |exception|
  #   redirect_to root_url , alert: "Your vote has been already cast"
  # end


end
