require 'rails_helper'

RSpec.describe Market, type: :model do 
  describe 'model methods' do 
    it 'can find a market by name' do 
      pearl = create(:market, name: "Pearl")
      jims = create(:market, name: "Jim's")

      expect(Market.find_by_name("Pearl")).to eq(pearl)
    end
  end
end