class ClassementController < ApplicationController
  before_action :authenticate_user!

  def index

    @team = Team.new
    @bestTeams = @team.get_best_team

  end

end
