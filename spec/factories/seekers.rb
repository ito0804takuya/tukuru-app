FactoryBot.define do
  factory :seeker do
    password = Faker::Internet.password(min_length: 8)
    name {"田中太郎"}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end