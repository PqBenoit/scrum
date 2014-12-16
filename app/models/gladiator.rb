class Gladiator < ActiveRecord::Base

	has_many :equipments
	belongs_to :team

end
