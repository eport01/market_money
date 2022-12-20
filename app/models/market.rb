class Market < ApplicationRecord
  # include PgSearch::Model 

  # pg_search_scope :global_search,
  #   against: [:name, :city, :state, :zip],
  #   using: {
  #     tsearch: {prefix: true }
  #   }

  def self.search(name, city, state, zip)
    Market.where("name ILIKE ? AND city ILIKE? AND state ILIKE? AND zip ILIKE?", "%#{name}%", "%#{city}%", "%#{state}%", "%#{zip}%")
  end

end 