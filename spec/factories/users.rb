FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name.slice(0, 40) }
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation {password}
    first_name { "山田"}
    last_name { "太郎" }
    #first_name { Faker::Name.first_name}
    #last_name { Faker::Name.last_name }
    last_name_kana { "カタカナ" }
    first_name_kana { "カタカナ" }
    birth_date { Faker::Date.birthday(min_age: 5, max_age: 94) }
  end
end
