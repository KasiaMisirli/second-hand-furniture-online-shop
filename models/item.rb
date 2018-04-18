class Item < ActiveRecord::Base
    validates :name, length: { in: 6..50 }
    validates :image, presence: true
    validates :price, presence: true
    validates :pricetype, presence: true
    validates :location, presence: true
    validates :description, presence: true
    has_many :images
end