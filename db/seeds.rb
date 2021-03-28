# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fighter_list = [
  {
    name: "Roger 'la Brute'",
    description: "Une montagne de graisse et de muscles",
    strength: 5,
    precision: 25,
    hit_points: 10
  },
  {
    name: "Geralt de Riv",
    description: "Un srocelleur aguéri",
    strength: 4,
    precision: 35,
    hit_points: 10
  },
  {
    name: "Raphaël de Pise",
    description: "Une des plus fines lames",
    strength: 2,
    precision: 55,
    hit_points: 10
  }
]

fighter_list.each do |fighter_params|
  Fighter.create(fighter_params)
end

fight = Fight.new(
  name: 'Le combat des titans',
  description: 'Une description'
)
fight.fighters << Fighter.find(1)
fight.fighters << Fighter.find(2)
fight.save!
fight.execute
fight.save!
