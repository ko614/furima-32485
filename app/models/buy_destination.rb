class BuyDestination
  include ActiveModel::Model
  attr_accessor  :post_code, :prefecture_id, :city, :address, :phone_number, :building_name, :user_id, :item_id, :token


  with_options presence: true do
    validates :post_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "電話番号は数字のみの１１桁以内で入力してください" }
    validates :user_id
    validates :item_id
    validates :token

  end

  validates :prefecture_id,numericality: { other_than: 0, message: "0以外を入力してください" } 

  


  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(buy: buy, post_code: post_code,prefecture_id: prefecture_id, city: city, address: address,building_name: building_name, phone_number: phone_number, buy_id:buy.id )
  end




end