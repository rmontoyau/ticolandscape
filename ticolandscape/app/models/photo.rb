class Photo < ApplicationRecord
	has_many 	:tags, as: :object
	belongs_to  :location 
	belongs_to	:photo_type
end
