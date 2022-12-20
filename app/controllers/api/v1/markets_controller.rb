class Api::V1::MarketsController < ApplicationController 
  def index 
    #get all markets
    render json: MarketSerializer.new(Market.all)
  end

  def show 
    #get one market by id 

    market = Market.find_by(params[:fmid])
    if market
      render json: MarketSerializer.new(market)
    else 
      render json: {error: "no market id"}, status: 404
    end
  end

  def search 
    if params[:name]
      self.market_by_name(params[:name])
    end


  end

  private 
  def market_by_name(params)
    markets = Market.find_by_name(params)
    if markets != nil || markets != []
      render json: MarketSerializer.new(markets)
    end
  end

  
end