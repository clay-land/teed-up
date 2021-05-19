class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :destroy, :update, :edit]

  def index
    @bags = policy_scope(Bag)
    @user = current_user
  end

  def new
    @bag = Bag.new
    authorize(@bag)
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    authorize(@bag)
    if @bag.save!
      redirect_to @bag
    else
      render 'new'
    end
  end

  def show
    @user = current_user
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
