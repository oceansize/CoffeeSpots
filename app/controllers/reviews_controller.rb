class ReviewsController < ApplicationController

    def new
        @coffeespot = Coffeespot.find params[:coffeespot_id]
        @review = Review.new
        @user = current_user
    end

    def create
        @coffeespot = Coffeespot.find params[:coffeespot_id]
        @review = @coffeespot.reviews.new review_params
        @review.user_id = current_user.id
        if @review.save
            flash[:notice] = 'Review created!'
            redirect_to '/coffeespots'
        else
            render 'new'
        end
    end

    def show
        @review = Review.find params[:id]
        @coffeespot = Coffeespot.find_by_id(@review.coffeespot_id)
        @user = User.find_by_id(@review.user_id)
    end
    
    def edit
        @review = Review.find_by_id params[:id]
        @coffeespot = Coffeespot.find_by_id(@review.coffeespot_id)
        @user = User.find_by_id(@review.user_id)
    end

    def update
        @coffeespot = Coffeespot.find params[:coffeespot_id]
        if  @coffeespot.reviews.find_by_id(params[:id]).update review_params
            flash[:notice] = 'Review updated!'
            redirect_to '/coffeespots'
        else
            render 'edit'
        end    
    end

    def destroy
        @review = Review.find_by_id params[:id]
        @review.destroy
        redirect_to root_path, notice: 'Review successfully deleted'
    end

    private

    def review_params
        params[:review].permit(:thoughts, :rating, :user_id)
    end

end

