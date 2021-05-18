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
  end

  def update
    if @rental.update(rental_params)
      redirect_to @rental
    else
      render 'edit'
    end
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
