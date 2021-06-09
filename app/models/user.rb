class User < ApplicationRecord
    has_many :topics
    has_many :topics, through: :entry
    has_secure_password
    
end
