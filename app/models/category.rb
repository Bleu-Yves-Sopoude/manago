class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  has_many :category_purchases
  belongs_to :user
  has_many :purchases, through: :category_purchases
end
