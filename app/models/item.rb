class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :ship_from_location
  belongs_to :delivery_start

  validates :name, :information, :category, :condition, :delivery_fee, :ship_from_location, :delivery_start, :image, presence: true
  validates :name, length: { maximum: 40 }
  validates :information, length: { maximum: 1_000 }
  validates :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_start_id, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
