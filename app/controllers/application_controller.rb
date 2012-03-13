class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def not_found
    render :nothing => true, :status => :not_found
  end

  def forbidden
    render :nothing => true, :status => :forbidden
  end
end
