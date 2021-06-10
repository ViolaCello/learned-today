class Entry < ApplicationRecord
  belongs_to :user
  has_many :topics



def possible_topics
 
  text = self.post 
  arr = text.split(' ')
  # byebug
  return arr
end




end
