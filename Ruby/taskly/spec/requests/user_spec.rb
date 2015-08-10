require 'rails_helper'

describe "POST /users", type: :request do
	it "creates a user" do
		post users_path(format: :json), user: {name: 'david', email: 'david@gmail.com'}

		expect(response).to have_http_status(200)
		expect(User.last.name).to eq('david')
	end
end

describe "GET /users" do
	before do
		@user = User.create name:'gulio', email: 'g@gmail.com'
		@user1 = User.create name: 'eliza', email: 'eliza@ironhack.com'
	end

	it "returns all users" do
		get users_path(format: :json)
		data = JSON.parse(response.body)

		expect(response).to have_http_status(200)
		expect(data.length).to eq(2)
	end
end
