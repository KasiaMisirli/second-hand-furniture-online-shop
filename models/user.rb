class User < ActiveRecord::Base
    has_secure_password 
    has_many :items
    validates :email, uniqueness: true
end