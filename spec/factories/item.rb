FactoryBot.define do
  factory :item do
    name                     {"ギター"}
    description              {"エレキギターです"}
    category_id              {2}
    status_id                {3}
    delivery_fee_id          {3}
    ship_form_id             {15}
    shipping_day_id          {2}
    price                    {900}
           
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end


  end
end