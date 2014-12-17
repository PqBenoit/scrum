class ClassementController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.where(user_id: current_user.id)
  end
end
