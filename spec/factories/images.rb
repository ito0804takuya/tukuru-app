FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/images/image.jpg")}
    item_id { 1 }
  end
end
