class RestaurantsController < ApplicationController
  def index
    HotpepperScrapingService.scrape
   render plain: ""
  end
end
