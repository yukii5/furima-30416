FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 3) }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    family_name           { '亜' }
    first_name            { '亜' }
    family_name_furikana      { 'カタカナ' }
    first_name_furikana       { 'カタカナ' }
    birthday              { '1930-01-01' }
    
  end
end
