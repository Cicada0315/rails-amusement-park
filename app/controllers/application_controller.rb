class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  private  
  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end
