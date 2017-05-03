class Profile < ApplicationRecord
	belongs_to	:user
	has_and_belongs_to_many :phones
	belongs_to 	:location
	has_many 	:experiencies
	has_many 	:tools
	has_many 	:social_nets
end
