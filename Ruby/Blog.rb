require "pry"

class Blog
	attr_accessor :my_posts

	def initialize
		@my_posts = []
		@position = 0
	end

	def add_post(post)
		@my_posts << post
	end

	def create_front_page
		@my_posts.sort_by! { |post, date| post.date}.reverse!
	end

	def publish_front_page
		# @my_posts = @my_posts.slice(@position, @position + 3)
		@my_posts.each do |v|
			puts v.title, v.date, "**************", v.text, "----------------"
			puts "Here is #{@position + 1} - #{@position + 3} of the #{@my_posts.length}!"
		end
		ask_for_input
	end

	def ask_for_input
		puts "Press N for the next page"
		info = gets.chomp
		if info == "n"
			turn_page
		end
	end

	def turn_page
		@position = @position + 3
		publish_front_page
	end

end

class Publish
	attr_accessor :blog

	def initialize(blog)
		@blog = blog
		@position = 0
	end

	def page_count
		page_count = @my_posts.length / 3
	end
end

class Post
	attr_accessor :title, :date, :text

	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

class Sponsored < Post
	def title
		return "This post is sponsored: #{@title}"
	end
end

# Posts = Post.new

first_post = Post.new("Today",  "2015, 6, 15", "We learned about Gems.")
second_post = Sponsored.new("Tomorrow", "2015, 6, 16", "We will learn about something new.")
third_post = Post.new("Thursday", "2015, 6, 17", "We will learn even MORE about Ruby.")

my_blog = Blog.new

my_blog.add_post(first_post)
my_blog.add_post(second_post)
my_blog.add_post(third_post)
my_blog.create_front_page
my_blog.publish_front_page

# blog.push Post.new("Today", "6.16.15", "We learned about Gems.")
# blog.push Post.new("Tomorrow", "6.17.15", "We will learn about something new.")
# blog.push Post.new("Thursday", "6.18.15", "We will learn even MORE about Ruby.")

# blog.publish_front_page
