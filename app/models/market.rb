class Market < ApplicationRecord

  def self.find_by_name(name)
    Market.where("name ILIKE ?", "%#{name}%")[0]
  end

  def self.find_by_city(city)
    Market.where("city ILIKE ?", "%#{city}%")[0]
  end

  def self.find_by_state(state)
    Market.where("state ILIKE ?", "%#{state}%")[0]
  end

  def self.find_by_zip(zip)
    Market.where("zip ILIKE ?", "%#{zip}%")[0]
  end
end 