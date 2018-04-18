class Item < ActiveRecord::Base
    validates :image, presence: true
    belongs_to :user
end