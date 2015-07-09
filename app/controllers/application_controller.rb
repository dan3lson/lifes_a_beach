class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end

  def beach_photo_urls
    [
      "http://photos.cntraveler.com/2014/07/31/53da72466dec627b149ead94_la-digue-island-seychelles-Arco-images-GmbH-Alamy.jpg",
      "http://photos.cntraveler.com/2014/11/13/5464d448cbbd2620680d904d_bora-bora-essay-2048-1152.jpg",
      "http://photos.cntraveler.com/2014/08/06/53e2e101c2d3f39d3610721a_na-pali-coast-kauai-hawaii-alamy.jpg",
      "http://dsx.weather.com//util/image/w/bestbeaches_cayodeaguavenezuela.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "http://dsx.weather.com//util/image/w/31islands_boracay.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "http://dsx.weather.com//util/image/w/bestbeaches_etretatfrance.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "http://dsx.weather.com//util/image/w/bestbeaches_lumahaihawaii.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "http://www.ggwallpaper.com/file/4659/2560x1440/crop/-shi-shi-beach-in-washington-state-1920x1080.jpg",
      "http://www.inparkmagazine.com/wp-content/uploads/2014/01/1524109_10152500433793378_910646857_o.jpg",
      "https://boonstoon.files.wordpress.com/2012/05/beach1.jpg",
      "http://www.vosizneias.com/wp-content/uploads/2015/06/miamb.jpg",
      "http://dsx.weather.com//util/image/w/cablebeach.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "http://dsx.weather.com//util/image/w/bestbeaches_glyfadacorfu.jpg?v=at&w=980&h=551&api=7db9fe61-7414-47b5-9871-e17d87b8b6a0",
      "https://upload.wikimedia.org/wikipedia/commons/e/e4/Spring_Lake_Beach.jpg"
    ]
  end
end
