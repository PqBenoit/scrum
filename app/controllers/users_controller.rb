class UsersController < ApplicationController
    def show
        @teams = Team.where(user_id: current_user.id)
    end
end
