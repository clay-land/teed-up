class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def show
    authorize(@rental)
  end

  def new
    @bag = Bag.find(params[:bag_id])
    @rental = Rental.new
    authorize(@rental)
  end

  def create
    @bag = Bag.find(params[:bag_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.bag = @bag
    authorize(@rental)
    if @rental.save
      redirect_to @rental
    else
      render 'new'
    end
  end

  def edit
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
