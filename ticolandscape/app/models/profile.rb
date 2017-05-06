class Profile < ApplicationRecord

	##################
	#Associations
	belongs_to	:user
	has_and_belongs_to_many :phones
	belongs_to 	:location
	has_many 	:experiences
	has_many 	:tools
	has_many 	:social_nets

	##################
  	#validations

  	validates :name, :last_name, :position, :dob, presence: true

end
