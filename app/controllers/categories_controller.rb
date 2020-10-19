class CategoriesController < ApplicationController
    before_action : require_login

    def index
        @categoeies = Category.all
    end
end
