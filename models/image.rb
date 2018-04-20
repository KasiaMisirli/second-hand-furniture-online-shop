require 'carrierwave'
require 'carrierwave/orm/activerecord'

class Image < ActiveRecord::Base
    validates :image, presence: true
    belongs_to :user
    belongs_to :item
end


class ImageUploader < CarrierWave::Uploader::Base
  storage :file
end

class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end