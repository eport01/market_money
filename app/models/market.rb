class Market < ApplicationRecord
  # include PgSearch::Model 

  # pg_search_scope :global_search,
  #   against: [:name, :city, :state, :zip],
  #   using: {
  #     tsearch: {prefix: true }
  #   }



  # def self.find_by_name(name)
  #   Market.where("name ILIKE ?", "%#{name}%")
  # end

  # def self.find_by_city(city)
  #   Market.where("city ILIKE ?", "%#{city}%")
  # end

  # def self.find_by_state(state)
  #   Market.where("state ILIKE ?", "%#{state}%")
  # end

  # def self.find_by_zip(zip)
  #   Market.where("zip ILIKE ?", "%#{zip}%")
  # end

  # def self.name_state(name, state)
  #   Market.where("name ILIKE ? AND state ILIKE?", "%#{name}%", "%#{state}")
  # end

  def self.search(name, city, state, zip)
    Market.where("name ILIKE ? AND city ILIKE? AND state ILIKE? AND zip ILIKE?", "%#{name}%", "%#{city}%", "%#{state}%", "%#{zip}%")
  end

end 