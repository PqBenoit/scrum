class GladiatorsController < ApplicationController
	def index 
		@gladiators = Gladiator.all
	end

	def show
		@gladiator = Gladiator.find(params[:id])
	end

	def create
		@gladiator = Gladiator.new(gladiator_params)
		@gladiator.save
	end

	def new	
	end

	private
		def gladiator_params
			params.require(:gladiator).permit(:name)
		end
end
