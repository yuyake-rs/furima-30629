class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :ship_from_location_id, :city, :block, :building, :phone_number
  with_options presence: true do
    validates :user_id, :item_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '郵便番号は、ハイフン半角(-)を入れて半角数字７桁で入力してください' }
    validates :block
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '市町村は、全角文字を使用してください' }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: '電話番号は、半角ハイフン(-)なしで入力してください' }
  end
  validates :ship_from_location_id, numericality: { other_than: 0, message: '都道府県を選択してください' }
  validates :phone_number, length: { maximum: 11, message: '電話番号は、11桁以内で入力してください' }
  validates :post_code, length: { maximum: 8, message: '郵便番号は、ハイフン半角(-)を入れて半角数字７桁で入力してください' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, ship_from_location_id: ship_from_location_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
