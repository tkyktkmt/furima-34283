FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    first_name { person.first}
    last_name { person.last}
    first_name_katakana { person.first.katakana}
    last_name_katakana { person.last.katakana}
    password = '1a' + Faker::Internet.password(min_length: 4, max_length: 20)
    password {password}
    password_confirmation {password}
    birthday {Faker::Date.birthday(min_age: 5, max_age: 100)}
  end
end

    
