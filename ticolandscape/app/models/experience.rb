class Experience < ApplicationRecord

	##################
	#Associations
	belongs_to	:profile

  	validates :title, :initial_date, presence: true
	
end
