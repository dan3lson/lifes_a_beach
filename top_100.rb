require 'nokogiri'
require 'open-uri'
require 'httparty'

BEACHES_URL = 'http://www.openwaterswimming.com/worlds-top-100-beaches/'

def beach_names
  @file = Nokogiri::HTML(open(BEACHES_URL))
  beach_links = @file.css("div[class='post-content']")
  beaches = beach_links.children[5].text.split("\n")
  beach_names = []
  beaches.each do |beach|
    slug = beach.split(" ")
    slug = slug[1..-1].join("+").gsub!(",","")
    slug = slug.delete(?\u{2019})
    slug = slug.delete(?\u{e9})
    beach = beach.split(" ")
    beach = beach[1..-1].join(" ")
    @url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{slug}&sensor=false&key=AIzaSyB6HUpc5kG0d7QMIXqMz-uYsxlQQM1m9CM"
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, 443)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = JSON.parse(http.request(request).body)
    unless response["results"].empty?
      beach_names << beach
    end
  end
  beach_names
end

def beach_slugs
  @file = Nokogiri::HTML(open(BEACHES_URL))
  beach_links = @file.css("div[class='post-content']")
  beaches = beach_links.children[5].text.split("\n")
  beach_slugs = []
  beaches.each do |beach|
    beach = beach.split(" ")
    beach = beach[1..-1].join("+").gsub!(",","")
    beach = beach.delete(?\u{2019})
    beach = beach.delete(?\u{e9})
    beach_slugs << beach
  end
  beach_slugs
end

def beach_urls
  urls = []
  beach_slugs.each do |slug|
    @url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{slug}&sensor=false&key=AIzaSyB6HUpc5kG0d7QMIXqMz-uYsxlQQM1m9CM"
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, 443)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = JSON.parse(http.request(request).body)
    unless response["results"].empty?
      lat = response["results"][0]["geometry"]["location"]["lat"]
      long = response["results"][0]["geometry"]["location"]["lng"]
      @url_2 = "https://maps.googleapis.com/maps/api/staticmap?zoom=13&size=700x300&maptype=roadmap&markers=color:blue%7Clabel:%7C#{lat},#{long}"
      urls << @url_2
    end
  end
  urls
end

def beach_hash
  Hash[beach_names.zip(beach_urls.map)]
end
