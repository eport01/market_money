require 'rails_helper'

RSpec.describe Market, type: :model do 
  describe 'model methods' do 
    it 'can find a market by name' do 
      pearl = create(:market, name: "Pearl")
      jims = create(:market, name: "Jim's")

      expect(Market.search("Pearl", '', '', '')[0]).to eq(pearl)
      expect(Market.search("Pearl", '', '', '')[0]).to_not eq(jims)

    end

    it 'can find a market by a combination of params' do
      pearl = create(:market, name: "Pearl", state: "CO", city: "Denver")
      jims = create(:market, name: "Jim's", state: "CO", city: "Aurora")
      kroger = create(:market, name: "Kroger", state: "OR", city: "Bend")

      expect(Market.search("Pearl", '', "CO", '')[0]).to eq(pearl)
      expect(Market.search("", '', "CO", '')).to eq([pearl, jims])
      expect(Market.search("Kroger", 'Bend', "OR", '')).to eq([kroger])

    end
    
  end
end