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
    if params[:city]
      self.market_by_city(params[:city])
    end
    if params[:state]
      self.market_by_state(params[:state])
    end
    if params[:zip]
      self.market_by_zip(params[:zip])
    end


  end

  private 

  def return_markets(markets)
    if markets != nil || markets != []
      render json: MarketSerializer.new(markets)
    end
  end
  def market_by_name(params)
    markets = Market.find_by_name(params)
    return_markets(markets)
  end

  def market_by_city(params)
    markets = Market.find_by_city(params)
    return_markets(markets)
  end

  def market_by_state(params)
    markets = Market.find_by_state(params)
    return_markets(markets)
  end

  def market_by_zip(params)
    markets = Market.find_by_zip(params)
    return_markets(markets)
  end


end