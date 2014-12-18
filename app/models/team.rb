class Team < ActiveRecord::Base

	has_many :gladiators

	def get_best_team
		@users = User.all
		@bestTeams = Hash.new
		@users.each do |u|
			@bestTeams[u.id] = Hash.new
			@teams = u.teams
			@teams.each do |t|
				ratio = t.victories.to_f/t.fights.to_f
				if @bestTeams[u.id].has_key?('ratio')
					if ratio > @bestTeams[u.id]['ratio']
						@bestTeams[u.id]['ratio'] = ratio.round(2)*100
						@bestTeams[u.id]['name'] = t.name
						@bestTeams[u.id]['username'] = u.name
						@bestTeams[u.id]['victories'] = t.victories
						@bestTeams[u.id]['fights'] = t.fights
					end
				else
					@bestTeams[u.id]['ratio'] = ratio.round(2)*100
					@bestTeams[u.id]['name'] = t.name
					@bestTeams[u.id]['username'] = u.name
					@bestTeams[u.id]['victories'] = t.victories
					@bestTeams[u.id]['fights'] = t.fights
				end

			end
		end

		@bestTeams = @bestTeams.sort_by{ |k, v| v[:ratio]}.reverse
		c = 0
		@bestTeams.each do |uId, t|
			c += 1
			t['pos'] = c
		end

		@bestTeams
	end

end
