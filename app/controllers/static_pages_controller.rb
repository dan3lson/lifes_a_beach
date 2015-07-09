class StaticPagesController < ApplicationController
  def home
    @random_beach_picture_url = beach_photo_urls.sample
    @random_beaches = []
    3.times do
      @random_beaches << Beach.all.sample
    end
  end
end
