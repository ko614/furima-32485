class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:status,:delivery_fee,:ship_form
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_day_id
    validates :ship_form_id
    validates :price,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

    

  end

  with_options numericality: { other_than: 1  } do
   validates :category_id
   validates :status_id
   validates :delivery_fee_id
   validates :shipping_day_id
  end

  

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字で入力して下さい。" } 

  validates :ship_form_id,numericality: { other_than: 0 } 
   
  
    
    
      
  



  belongs_to :user
  has_one :buy
  has_one_attached :image
  
 


end
