class RestaurantsController < ApplicationController
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.new
  end

  def new
    @restaurant = Restaurant.new
    @categories = CATEGORIES
  end

  def create
    # @restaurant = Restaurant.find(params[:id])
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      @categories = CATEGORIES
      render :new
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
