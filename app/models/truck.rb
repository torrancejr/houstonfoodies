class Truck < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :location, presence: true
  
end