class User < ApplicationRecord
    has_many :entries
    has_many :topics, through: :entries

    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password

end
