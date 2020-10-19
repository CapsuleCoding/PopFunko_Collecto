class LocationsController < ApplicationController
    before_action :require_login

    def new
        if @pop_funko = PopFunko.find_by_id(params[:pop_funko_id])
            @location = @pop_funko.locations.build
        else 
            @location = Location.new
        end
    end

    def create
        @location = Location.new(location_params)
        @review.user_id = session[:user_id]
        if location.save
            redirect_to pop_funkos_path
        else
            render :new
        end
    end

    def show 
        @location = Location.find_by_id(params[:id])
    end

    def edit
    end

    def index
        if @pop_funko = PopFunko.find_by_id(params[:pop_funko_id])
            @locations = @pop_funko.locations
        else
            @pop_funko = Location.all
        end
    end

    private

    def location_params
        params.require(:location).permit(:pop_funko_id, :address)

    end

    def set_loction
        @location = Location.find_by(id: params[:id])
    end
end
