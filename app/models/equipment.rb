class Equipment < ActiveRecord::Base

	belongs_to :gladiator
	has_many :gladiators, :through => :gladiator_equipments
	has_many :gladiator_equipments

end
