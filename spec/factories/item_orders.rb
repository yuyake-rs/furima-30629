FactoryBot.define do
  factory :item_order do
    # number {1234123412341234}
    # exp_month {12}
    # exp_year {22}
    # cvc {123}
    post_code { '111-1111' }
    ship_from_location_id { 1 }
    city { '渋谷区' }
    block { '1-1' }
    building { 'TECHハイツ' }
    phone_number { '09012341234' }
    user_id { 1 }
    item_id { 1 }
  end
end
