class ClassementController < ApplicationController
  before_action :authenticate_user!

  def index

  	@users = User.all
  	@allteams = Team.all

  	@userteam = []

  	@users.each do |user|

  		@bestTeam = Team.select(['name', 'description', 'victories', 'fights', 
  								'cast((victories) as float)/cast((fights) as float)*100 as ratio'])
  								.where(user_id: user.id ).order('ratio DESC').all.limit(1)

  		@userteam.push(@bestTeam)

  	end

    @teams = Team.select(['name', 'description', 'victories', 'fights', 'cast((victories) as float)/cast((fights) as float)*100 as ratio']).order('ratio DESC').all
    @top10teams = Team.select(['name', 'description', 'victories', 'fights', 'cast((victories) as float)/cast((fights) as float)*100 as ratio']).order('ratio DESC').all.limit(10)

  end
end
