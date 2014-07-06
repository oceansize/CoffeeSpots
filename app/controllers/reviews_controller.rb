class ReviewsController < ApplicationController

  def new
    @coffeespot = Coffeespot.find params[:coffeespot_id]
    @review = Review.new
  end

  def create
    @coffeespot = Coffeespot.find params[:coffeespot_id]
    @review = @coffeespot.reviews.create params[:review].permit(:thoughts, :rating)
    flash[:notice] = 'Review created!'
    redirect_to '/coffeespots'
  end
end
