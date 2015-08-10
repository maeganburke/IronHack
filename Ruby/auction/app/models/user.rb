class User < ActiveRecord::Base
	has_many :products

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	def show_name
		[name].compact.join(" - ")
	end

	def show_email
		[email].compact.join(" - ")
	end
end
