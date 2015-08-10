class Bid < ActiveRecord::Base
	
	has_one :product
	
	validates :amount, presence: true

end
