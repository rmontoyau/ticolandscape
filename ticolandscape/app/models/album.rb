class Album < ApplicationRecord
	has_many :tags, as: :object
	belongs_to :location
	has_and_belongs_to_many :photos
	belongs_to :album_type
end
