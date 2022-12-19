class Market < ApplicationRecord

  def self.find_by_id(fmid)
    Market.where(fmid)
  end
end 