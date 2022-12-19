require 'rails_helper'

describe "Markets API endpoints" do 
  describe 'api/v1/markets' do 
    it 'sends a list of all markets' do 
      create_list(:market, 3)

      get '/api/v1/markets'

      expect(response).to be_successful 
      markets = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(markets.count).to eq(3)

      markets.each do |market|
        expect(market).to have_key(:id)
        expect(market[:id].to_i).to be_an(Integer)

        expect(market[:attributes]).to have_key(:fmid)
        expect(market[:attributes][:fmid]).to be_a(Integer)

        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)

        expect(market[:attributes]).to have_key(:zip)
        expect(market[:attributes][:zip]).to be_a(String)
      end
    end
  end

  describe 'api/v1/markets/market_id' do 
    it 'get one market by id' do 
      market = create(:market) 

      get "/api/v1/markets/#{market.fmid}"

      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful

      expect(market_response[0][:attributes][:fmid]).to eq(market.fmid)
      expect(market_response[0][:attributes][:name]).to eq(market.name)


    end
  end
end