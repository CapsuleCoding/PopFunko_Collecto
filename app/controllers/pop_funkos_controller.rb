class PopFunkosController < ApplicationController
    before_action :set_pop_funko, only: [:edit, :update, :show, :destroy]

    before_action :require_login


    def new 
        @pop_funko = PopFunko.new
        @pop_funko.build_category
    end

    def create
        @pop_funko = PopFunko.new(pop_funko_params)
        @pop_funko.user_id = session[:user_id]
            if @pop_funko.save
                redirect_to pop_funko_path(@pop_funko)
            else
                render :new
            end
        end
    end

    def index
        @@pop_funko = PopFunko.order_by_location
    end

    def show
        @stores = @pop_funko.locations
    end

    def edit
    end

    def update
        if @pop_funko.update(pop_funko_params)
            redirect_to pop_funko_path
              flash[:notice] = "Update is now complete!"

        else
            render :edit

        end

    end

    def destroy
        @pop_funko.destroy
        redirect_to pop_funko_path
        flash[:notice] = "Delete Complete"
    end

    private

    def pop_funko_params
        params.require(:pop_funko).permit(:name, :price, :category_id, category_attributes: [:name])
    end

    def set_pop_funko
        @pop_funko = PopFunko.find_by(id: params[:id])
    end
end
