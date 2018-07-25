class Review < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  has_many :votes

  def score
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end