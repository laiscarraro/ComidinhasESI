class RatingsController < ApplicationController
    def index
        if session[:user_id] == nil
            redirect_to '/login/index'
        end
    end

    def create
        redirect_to root_path
    end
end
