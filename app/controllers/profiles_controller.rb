class ProfilesController < ApplicationController
    before_action :require_user_logged_in!

    def new
    end
end