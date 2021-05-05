FactoryBot.define do
  factory :order_location do
    address = Gimei.address

    postal_code { "#{Faker::Number.number(digits: 3)}" + '-' + "#{Faker::Number.number(digits: 4)}" }
    province_id { Faker::Number.within(range: 1..47) }
    city { address.city.kanji }
    address_line1 { Faker::Address.building_number }
    phone_number {Faker::Number.between(from: 1, to: 99999999999)}
  end
end

# city { address.city.kanji address.town.kanji }