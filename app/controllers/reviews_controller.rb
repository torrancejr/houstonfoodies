class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @truck = Truck.find(params[:truck_id])
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @review = Review.new(review_params)
    @review.truck = @truck
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review added successfully"
      UserMailer.new_review(@review).deliver_now
      redirect_to truck_path(@truck)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @truck = Truck.find(params[:truck_id])
    @review = Review.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:truck_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated!"
      redirect_to truck_path(@truck)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @truck = Truck.find(params[:truck_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted"
    redirect_to truck_path(@truck)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end