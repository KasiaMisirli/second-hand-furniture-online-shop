class Item < ActiveRecord::Base
    validates :name, length: { in: 6..50 }
    validates :image_url, presence: true
    validate :price, presence: true
    validate :pricetype, presence: true
    validate :location, presence: true
    validate :description, presence: true
    has_many :images
end