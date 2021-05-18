class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :destroy, :update, :edit]

  def index
    @bags = Bag.all
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save!
      redirect_to bags_path
    else
      render 'new'
    end
  end
  
  def show; end
  
  def edit; end
  
  def update
    if @bag.update(bag_params)
      redirect_to @bag
    else
      render 'edit'
    end
  end
    
  def destroy
    if @bag.destroy
      redirect_to bags_url
    else
      redirect_to bags_url
    end
  end
  
  private

  def bag_params
    params.require(:bag).permit(:name, :description, :location, :rate)
  end
  
  def set_bag
    @bag = Bag.find(params[:id])
  end

end
