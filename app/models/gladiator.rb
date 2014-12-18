class Gladiator < ActiveRecord::Base

	has_many :equipments, :through => :gladiator_equipments
	has_many :gladiator_equipments
	belongs_to :team

end
