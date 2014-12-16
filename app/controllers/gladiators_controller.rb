class GladiatorsController < ApplicationController
	before_action :authenticate_user!
	def index 
		@gladiators = Gladiator.all
	end

	def show
		@gladiator = Gladiator.find(params[:id])
	end

	def create
		@gladiator = Gladiator.new(gladiator_params)
		@gladiator.save

		@team = Team.find_by_id(@gladiator.team_id)

		redirect_to @team
	end

	def new
	end

	private
		def gladiator_params
			params.require(:gladiator).permit(:name, :team_id)
		end
end
