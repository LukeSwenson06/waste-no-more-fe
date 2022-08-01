class FoodbanksController < ApplicationController
    def index
        @foodbanks = FoodbankFacade.search_states(params[:states])
    end

    def search 
    end

    def show 
        @foodbank = FoodbankFacade.foodbank_info(params[:id])
    end
    
end