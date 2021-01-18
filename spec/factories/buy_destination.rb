FactoryBot.define do
  factory :buy_destination do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '243-0427' }
    prefecture_id { 5 }
    city { '海老名市' }
    address { '杉久保南3-14-26' }
    building_name { 'テックマンション' }
    phone_number { '08012663378' }
    user_id  { 1 }
    item_id  { 1 }

    
  end
end