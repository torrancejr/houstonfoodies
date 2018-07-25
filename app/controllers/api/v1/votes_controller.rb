class Api::V1::VotesController < ApplicationController
  def create
    #Find Vote if exists
    #if the vote doesn't exist
    review = Review.find(params[:review_id])
    @vote = Vote.where(review: review, user: current_user)

    if @vote.empty?
      Vote.create(review: review, user: current_user, upvote: params[:vote])
      render json: { score: review.score }
    elsif @vote.exists?
      Vote.update(review: review, user: current_user, upvote: params[:vote])
      render json: { score: review.score }
    end
  end
end