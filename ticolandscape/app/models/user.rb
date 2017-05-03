class User < ApplicationRecord
	acts_as_authentic do |c|
		c.validates_uniqueness_of_email_field_options :if => lambda{false}
  	end
  	##################
  	#Associations
	belongs_to 	:role
	has_one		:profile

  	##################
  	#validations
  		
end
