class CoffeespotsController < ApplicationController

  def index
    @coffeespots = Coffeespot.all
  end

  def new
  end

  def create
    Coffeespot.create coffeespot_params()
    redirect_to '/coffeespots'
  end

  private

  def coffeespot_params
    # params = {coffeespot: {name: jon, cohort: may}}
    params.require(:coffeespot).permit(:name)
  end
end
