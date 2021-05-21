class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :destroy, :update, :edit]

  def index
    if params[:query].present? && params[:search_by] == "location"
      @bags = policy_scope(Bag.near(params[:query], params[:km].to_i))
    elsif params[:query].present? && params[:search_by] == "brand"
      @bags = policy_scope(Bag.search_by_brand(params[:query]))
    else
      @bags = policy_scope(Bag)
    end

    @markers = @bags.geocoded.map do |bag|
      {
        lat: bag.latitude,
        lng: bag.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bag: bag })
      }
    end
  end

  def new
    @bag = Bag.new
    authorize(@bag)
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    authorize(@bag)
    if @bag.save
      redirect_to @bag
    else
      render 'new'
    end
  end

  def show
    @rental = Rental.new
    @markers = [
      {
        lat: @bag.latitude,
        lng: @bag.longitude
      }
    ]
  end

  def edit; end

  def update
    if @bag.update(bag_params)
      redirect_to @bag
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to bags_url if @bag.destroy
  end

  private

  def bag_params
    params.require(:bag).permit(:name, :description, :location, :rate, photos: [])
  end

  def set_bag
    @bag = Bag.find(params[:id])
    authorize(@bag)
  end
end
