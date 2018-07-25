class TrucksController < ApplicationController

  def index
    @trucks = Truck.all
  end


  def show
    @truck = Truck.find(params[:id])
    @reviews = @truck.reviews
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    if @truck.save
      redirect_to truck_path(@truck)
      flash[:notice]="Successfully created venue"
    else
      flash[:notice] = @truck.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def truck_params
    params.require(:truck).permit(:name, :location, :website, :photo, :rating)
  end
end