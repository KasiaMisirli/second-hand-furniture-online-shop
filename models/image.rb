class Image < ActiveRecord::Base
    validates :image, presence: true
    belongs_to :user
    belongs_to :item
end