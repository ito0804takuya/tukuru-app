FactoryBot.define do
  factory :job do
    name {Faker::Name.last_name}
    body {Faker::Lorem.sentence}
    tel {"00011112222"}
    email {Faker::Internet.free_email}
    url {"abc"}
    postal_code {"0001111"}
    city {"abc"}
    block {"abc"}
    bulding {"abc"}
    prefecture_id {"1"}
    company_id {"1"}
  end
end