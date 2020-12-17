class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from_location
  belongs_to :delivery_start

  with_options presence: true do
    validates :name, :information, :image
    validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  end
  validates :name, length: { maximum: 40 }
  validates :information, length: { maximum: 1_000 }
  validates :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_start_id, numericality: { other_than: 0, message: 'プルダウンから入力してください' }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300〜9,999,999の範囲で入力してください' }
end
