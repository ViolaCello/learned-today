class User < ApplicationRecord
    has_many :topics
    has_many :topics, through: :entry
end
