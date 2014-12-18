class GladiatorEquipment < ActiveRecord::Base
	
	belongs_to :equipment
	belongs_to :gladiator

end
