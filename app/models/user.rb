class User < ApplicationRecord
    has_many :topics
    has_many :topics, through: :entry

    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password

end
