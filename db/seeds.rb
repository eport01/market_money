# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'pry'

Market.destroy_all

i = 0
CSV.foreach('./db/farmers_markets.csv') do |csv_line|
    i+=1
    next if i ==1
    data = {
        fmid: csv_line[0],
        name: csv_line[1],
        street: csv_line[7],
        city: csv_line[8],
        county: csv_line[9],
        state: csv_line[10],
        zip: csv_line[11],
        # x_lat: csv_line[20],
        # y_long: csv_line[21],
        # location: csv_line[22],
        # credit: csv_line[23],
        # wic: csv_line[24],
        # wic_cash: csv_line[25],
        # sfmnp: csv_line[26],
        # snap: csv_line[27],
        # organic: csv_line[28],
        # baked_goods: csv_line[29],
        # cheese: csv_line[30],
        # crafts: csv_line[31],
        # flowers: csv_line[32],
        # eggs: csv_line[33],
        # seafood: csv_line[34],
        # herbs: csv_line[35],
        # vegetables: csv_line[36],
        # honey: csv_line[37],
        # jams: csv_line[38],
        # maple: csv_line[39],
        # meat: csv_line[40],
        # nursery: csv_line[41],
        # nuts: csv_line[42],
        # plants: csv_line[43],
        # poultry: csv_line[44],
        # prepared: csv_line[45],
        # soap: csv_line[46],
        # trees: csv_line[47],
        # wine: csv_line[48],
        # coffee: csv_line[49],
        # beans: csv_line[50],
        # fruits: csv_line[51],
        # grains: csv_line[52],
        # juices: csv_line[53],
        # mushrooms: csv_line[54],
        # pet_food: csv_line[55],
        # tofu: csv_line[56],
        # wild_harvested: csv_line[57],
    }
    Market.create(data)
end 
