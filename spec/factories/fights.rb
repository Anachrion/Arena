FactoryBot.define do
  factory :fight do
    sequence(:name) { |n| "Fight #{n}" }
    sequence(:description) { |n| "Fight description #{n}" }
    fighters { [association(:fighter), association(:fighter)] }
  end
end
