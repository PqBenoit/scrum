class Team < ActiveRecord::Base

	has_many :gladiators
	has_one :user

end
