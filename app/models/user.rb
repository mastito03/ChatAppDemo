class User < ApplicationRecord
  has_many :messages
  has_many :rooms, through: :messages
end
