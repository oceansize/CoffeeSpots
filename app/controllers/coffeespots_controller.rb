class CoffeespotsController < ApplicationController

  def index
    @coffeespots = Coffeespot.all
  end

end
