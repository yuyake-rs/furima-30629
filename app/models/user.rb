class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  # has_many :purchase_records

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_day, presence: true
  

end
