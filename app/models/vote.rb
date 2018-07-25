class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :review, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :review }

  
end