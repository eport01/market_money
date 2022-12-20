class MarketSerializer 
  include JSONAPI::Serializer 
  attributes :fmid, :name, :street, :city, :county, :state, :zip  
end