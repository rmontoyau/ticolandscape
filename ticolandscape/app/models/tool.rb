class Tool < ApplicationRecord
	belongs_to	:profile
	validates_length_of :name,:minimum =>  2
end
