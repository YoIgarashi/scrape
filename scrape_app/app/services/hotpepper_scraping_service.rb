require 'open-uri'
require 'nokogiri'

class HotpepperScrapingService
  BASE_URL = 'https://www.hotpepper.jp/SA11/Y030/dncLT0089/'

  def self.scrape
    html = URI.open(BASE_URL).read
    doc = Nokogiri::HTML.parse(html)

    
    restaurants = doc.css('.shopDetailBottom').map do |shop|
      {
        name: shop.at('.shopDetailStoreName').text.strip,
        address: shop.at('.parentGenreName').text.strip,
        phone: shop.at('.shopDetailGenreCatch').text.strip
      }
    end

    # データをデータベースに保存
    restaurants.each do |restaurant|
      Restaurant.create!(name: restaurant[:name], address: restaurant[:address], phone: restaurant[:phone])
    end
  end 
end