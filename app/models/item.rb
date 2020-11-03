class Item < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :category
	belongs_to :condition
	belongs_to :delivery_fee
	belongs_to :ship_from_location
	belongs_to :delivery_start
end
