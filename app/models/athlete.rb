class Athlete < ApplicationRecord
  belongs_to :user
  has_many :sports, dependent: :destroy
end
