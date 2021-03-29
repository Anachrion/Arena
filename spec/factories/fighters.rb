FactoryBot.define do
  factory :fighter do
    sequence(:name) { |n| "Fighter #{n}" }
    sequence(:description) { |n| "Fighter description #{n}" }
    hit_points {rand(10..25)}
    strength {rand(5..10)}
    precision {rand(20..55)}
    level{rand(1..5)}
  end
end
