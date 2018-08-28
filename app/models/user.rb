class User < ApplicationRecord
  has_many :athletes, dependent: :destroy
end
