class Phone < ApplicationRecord
	has_one :users
	belongs_to :phone_type
	validates_length_of :number, :minimum =>  2
end
