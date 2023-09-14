class MainController < ApplicationController
    def index
        redirect_to reservation_path
    end
end