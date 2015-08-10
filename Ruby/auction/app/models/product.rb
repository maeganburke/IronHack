class Product < ActiveRecord::Base

	has_one :user
	belongs_to :user
	has_many :bids

	# validates :user_id, presence: true
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true

	def self.search_by_letter(letter)
		where("title LIKE '#{letter}%'")
	end

	def show_title
		[title].compact.join(" - ")
	end

	def show_description
		[description].compact.join(" - ")
	end

	def show_deadline
		[deadline].compact.join(" - ")
	end
	
end

