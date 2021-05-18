class BagsController < ApplicationController
  before_action :set_bag, only: [:show, :destroy, :update, :edit]

  def index
    @bags = Bag.all
  end

  def new
    @bag = Bag.new
    @user = current_user
  end

  def create
    @bag = Bag.new(bag_params)
    if @bag.save!
      flash[:success] = "Bag successfully created"
      redirect_to bags_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show; end
  

  def edit; end
  
  def update
      if @bag.update(bag_params)
        flash[:success] = "Bag was successfully updated"
        redirect_to @bag
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
    
  def destroy
    if @bag.destroy
      flash[:success] = 'Bag was successfully deleted.'
      redirect_to bags_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to bags_url
    end
  end
  
  private

  def bag_params
    params.require(:bag).permit(:name, :description, :location, :rate)
  end
  
  def set_bag
    @bag = Bag.find(:id)
  end

end
