class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    authenticate_or_request_with_http_basic do |username, password|
      username == "pat" && password == "admin"
    end
  end

end
