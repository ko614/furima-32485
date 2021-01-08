FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaaa00"}
    password_confirmation {password}
    family_name           {"大澤"}
    first_name            {"昂平"}
    family_name_kana      {"オオサワ"}
    first_name_kana       {"コウヘイ"}
    birth_day             {"1995-06-14"}


  end
end