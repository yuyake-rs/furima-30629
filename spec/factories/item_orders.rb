FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '111-1111' }
    ship_from_location_id { 1 }
    city { '渋谷区' }
    block { '1-1' }
    building { 'TECHハイツ' }
    phone_number { '09012341234' }
  end
end
