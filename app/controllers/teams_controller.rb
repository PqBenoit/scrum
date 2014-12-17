class TeamsController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user != nil
	        @teams = Team.where(user_id: current_user.id)
	        @gladiators = Gladiator.where(team_id: nil)
	    end
	end

	def show
		@team = Team.find(params[:id])
		@gladiators = Gladiator.where(team_id: @team.id)
		@equipments = Equipment.all
	end

	def new
	end

	def create
		@team = Team.new(team_params)
		@team.user_id = current_user.id
		@team.save

		redirect_to @team
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])

		if @team.update(team_params)
			redirect_to @team
		else
			render 'edit'
		end
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy

		render 'index'
	end

	def set_equipment
		@gladiator_equipment = GladiatorEquipment.new()
		@equipment = Equipment.find(params[:id_equipement])
		@gladiator = Gladiator.find(params[:id_gladiateur])

		@gladiator_equipment.equipment_id = @equipment.id
		@gladiator_equipment.gladiator_id = @gladiator.id

		@gladiator_equipment.save

		respond_to do |format|
			format.js { render inline: "location.reload();" }
		end
	end

	private
		def team_params
			params.require(:team).permit(:name, :description)
		end

end
