class CoffeespotsController < ApplicationController

    def index
        @coffeespots = Coffeespot.all
    end

    def new
        @coffeespot = Coffeespot.new
        @user = current_user
    end

    def create
        @coffeespot = Coffeespot.new coffeespot_params
        @coffeespot.user_id = current_user.id
        if @coffeespot.save
            flash[:notice] = 'CoffeeSpot added!'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @coffeespot = Coffeespot.find params[:id]
        @user = User.find_by_id(@coffeespot.user_id)
    end

    def edit
        @coffeespot = Coffeespot.find params[:id]
    end

    def update
        @coffeespot = Coffeespot.find params[:id]
        if @coffeespot.update coffeespot_params
            flash[:notice] = 'CoffeeSpot updated!'
            redirect_to coffeespot_path(@coffeespot.id)
        else
            render 'edit'
        end
    end

    def destroy
        @coffeespot = Coffeespot.find params[:id]
        @coffeespot.destroy
        flash[:notice] = 'CoffeeSpot deleted!'
        redirect_to root_path
    end

    private

    def coffeespot_params
        params[:coffeespot].permit(:name, :url, :user_id)
    end

end
