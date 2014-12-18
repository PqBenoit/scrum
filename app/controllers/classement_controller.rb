class ClassementController < ApplicationController
  before_action :authenticate_user!

  def index

    @users = User.all
    @allteams = Team.all

    @teams = Team.select(['name', 'description', 'victories', 'fights', 'cast((victories) as float)/cast((fights) as float)*100 as ratio']).order('ratio DESC').all
    @top10teams = Team.select(['name', 'description', 'victories', 'fights', 'cast((victories) as float)/cast((fights) as float)*100 as ratio']).order('ratio DESC').all.limit(10)
  end
end
