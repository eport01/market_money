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
      other_market = create(:market) 

      get "/api/v1/markets/#{market.fmid}"

      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(market_response[:attributes][:fmid]).to eq(market.fmid)
      expect(market_response[:attributes][:name]).to eq(market.name)
      expect(market_response[:attributes][:name]).to_not eq(other_market.name)
    end

    it 'an invalid fmid returns a 404 error with a descriptive message' do 
      get "/api/v1/markets/5"

      message = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status 404
      expect(message[:error]).to eq("no market id")

    end

  end

  describe 'api/v1/markets/search?name=market.name' do 
    it 'get all markets by name' do 
      market = create(:market, name: "Pearl")

      get "/api/v1/markets/search?name=Pearl"
      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(market_response[0][:attributes][:name]).to eq(market.name)
    end

    it 'get all markets by city' do 
      market = create(:market, city: "Denver")
      get "/api/v1/markets/search?city=Denver"
      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(market_response[0][:attributes][:city]).to eq(market.city)
    end

    it 'get all markets by state' do 
      market = create(:market, state: "CO")
      get "/api/v1/markets/search?state=CO"
      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(market_response[0][:attributes][:state]).to eq(market.state)
    end

    it 'get all markets by zip' do 
      market = create(:market, zip: "12345")
      get "/api/v1/markets/search?zip=12345"
      market_response = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(market_response[0][:attributes][:zip]).to eq(market.zip)
    end

    it 'get all markets by multiple params' do 
      market = create(:market, name: "Sams", zip: "12345")
      market2 = create(:market, name: "Jims")
      get "/api/v1/markets/search?name=Sams&zip=12345"
      market_response = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(market_response[0][:attributes][:zip]).to eq(market.zip)
      expect(market_response[0][:attributes][:name]).to eq(market.name)
      expect(market_response[0][:attributes][:name]).to_not eq(market2.name)

    end


  end
end