class RestaurantsController < ApplicationController
  def index
    if Restaurant.count == 0
      # レストランが存在しない場合のみスクレイピングを実行
      HotpepperScrapingService.scrape
    end
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
