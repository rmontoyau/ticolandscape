class Experience < ApplicationRecord

	##################
	#Associations
	belongs_to	:profile

  	validates :title, :summary, :initial_date, presence: true
	
end
