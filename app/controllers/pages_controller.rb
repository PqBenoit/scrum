class PagesController < ApplicationController

  def index
    if current_user != nil
        @teams = Team.where(user_id: current_user.id)
    end
  end

end
