class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.integer :fmid
      t.string :name
      t.string :street
      t.string :city
      t.string :county
      t.string :state
      t.string :zip
    end
  end
end
