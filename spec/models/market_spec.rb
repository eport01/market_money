require 'rails_helper'

RSpec.describe Market, type: :model do 
  describe 'model methods' do 
    it 'can find a market by name' do 
      pearl = create(:market, name: "Pearl")
      jims = create(:market, name: "Jim's")

      expect(Market.find_by_name("Pearl")).to eq(pearl)
      expect(Market.find_by_name("Pearl")).to_not eq(jims)

    end

    it 'can find a market by city' do 
      pearl = create(:market, city: "Denver")
      jims = create(:market, city: "Minneapolis")

      expect(Market.find_by_city("Minneapolis")).to eq(jims)
      expect(Market.find_by_city("Minneapolis")).to_not eq(pearl)

    end

    it 'can find a market by state' do 
      pearl = create(:market, state: "CO")
      jims = create(:market, state: "MN")

      expect(Market.find_by_state("CO")).to eq(pearl)
      expect(Market.find_by_state("cCO")).to_not eq(jims)
    end


    it 'can find a market by zip' do 
      pearl = create(:market, zip: 12345)
      jims = create(:market, zip: 54321)

      expect(Market.find_by_zip(12345)).to eq(pearl)
      expect(Market.find_by_zip(12345)).to_not eq(jims)
    end
  end
end