class TournamentsController < ApplicationController
    before_action :set_tournament, only: [:show]

    def index
        @tournaments = Tournament.all
    end

    def show

    end

    def register
        @tournament_user = TournamentUser.new(user_id: current_user.id, tournament_id: params[:tournament_id])
        @tournament_user.save()
        @tournaments = Tournament.all
        respond_to do |format|
            format.js {render inline: "location.reload();" }
        end
    end

    def unregister
        @tournament_user = TournamentUser.find_by(user_id: current_user.id, tournament_id: params[:tournament_id])
        @tournament_user.destroy
        @tournaments = Tournament.all
        respond_to do |format|
            format.js {render inline: "location.reload();" }
        end
    end

    private

        def set_tournament
            @tournament = Tournament.find(params[:id])
        end
end
