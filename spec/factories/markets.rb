FactoryBot.define do 
  factory :market do 
    fmid { Faker::Address.building_number }
    name { Faker::Address.community }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    county { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }

  end
end