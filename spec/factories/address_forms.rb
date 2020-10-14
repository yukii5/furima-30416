FactoryBot.define do
  factory :address_form do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '547-0076' }
    region_id { 27 }
    municipalities { '大阪市中央区' }
    house_number { '難波５丁目１−６０' }
    building_name { 'なんばスカイオ15F' }
    phone_number { '09012345678' }
  end
end
