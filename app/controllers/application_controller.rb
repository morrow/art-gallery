class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user
    authenticate_or_request_with_http_basic do |username, password|
      username == "pat" && password == "admin"
    end
  end

  def get_images
    @images = Image.all.sort_by(&:name)
    json = {}
    @images.each do |image|
      json[image.id] = image.image.to_s
    end
    @images_json = json.to_json
  end

  def get_categories
    @categories = Category.all
  end

end
