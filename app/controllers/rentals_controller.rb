class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @bag = Bag.find(params[:bag_id])
    @rental = Rental.new
  end

  def create
  end

  def edit
    @bag = @rental.bag
  end

  def update
  end

  def destroy
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
