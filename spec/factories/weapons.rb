FactoryBot.define do
  factory :weapon do
    sequence(:name) { |n| "Weapon #{n}" }
    sequence(:description) { |n| "Weapon description #{n}" }
    precision_modifier {rand(1..10)}
    damage_modifier {rand(1..10)}
  end
end
