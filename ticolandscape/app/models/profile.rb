class Profile < ApplicationRecord

	##################
	#Associations
	belongs_to	:user
	has_and_belongs_to_many :phones
	belongs_to 	:location
	belongs_to 	:phone
	has_many 	:experiences
	has_many 	:tools
	has_many 	:social_nets

	##################
  	#validations
	accepts_nested_attributes_for :location
	accepts_nested_attributes_for :phone
  	validates :name, :last_name, :position, :dob, presence: true
  	validates_length_of :name, :last_name, :position,:minimum =>  2

end
