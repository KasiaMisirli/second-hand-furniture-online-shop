require 'carrierwave'
require 'carrierwave/orm/activerecord'


class ImageUploader < CarrierWave::Uploader::Base
    if Sinatra::Application.settings.development?
        include CarrierWave::MiniMagick
    else
        include Cloudinary::CarrierWave
    end
    # process resize_to_fit: [800, 800]
    version :thumb do
        process resize_to_fill: [300,300]
    end


    if Sinatra::Application.settings.development?
        storage :file
    end

end

class Image < ActiveRecord::Base
  validates :image, presence: true
  belongs_to :user
  belongs_to :item

  mount_uploader :image, ImageUploader
end
