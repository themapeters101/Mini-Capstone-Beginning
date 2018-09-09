class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :descrpition, presence: true
  validates :descrpition, length: { minimum: 20}
  validates :descrpition, length: { maximum: 200}
  validates :image_url, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :supplier

  discount_message = 

  def is_discounted?
    price < 1000000
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
