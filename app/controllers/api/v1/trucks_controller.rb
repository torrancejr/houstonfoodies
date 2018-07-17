class Api::V1::TrucksController < ApplicationController
  def index
    render json: { trucks: Truck.all }
  end
end