FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '0000aaaa' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太朗' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birth_day             { '1930-01-01' }
  end
end
