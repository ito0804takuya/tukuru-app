FactoryBot.define do
  factory :company do
    password = Faker::Internet.password(min_length: 8)
    name {"ものづくり株式会社"}
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
  end
end