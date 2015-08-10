require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
  validates_presence_of :name, :handle # presence, name+handle #dont need this right?
  validates :name, presence: true, uniqueness: true # presence+uniqueness, name
  validates :handle, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: 8 }
  has_many :shouts
end

class Shout < ActiveRecord::Base
  validates :likes, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :message, presence: true, numericality: { greater_than_or_equal_to: 200 }
  validates :userid, presence: true, uniqueness: true
  has_one :userid
  belongs_to :user
end

# -------------- TESTS ------------------#

describe User do
  
  before do
  	sharon = User.find_by(name: "Sharon")
    sharon.destroy if sharon # we have to destroy sharon as a user before running the next text, otherwise the tests will fail although they are true
    @sharon = User.new
    @sharon.name = "Sharon"
    @sharon.handle = "sharebear"
    @sharon.password = "730571638493760"
    maegan = User.find_by(name: "Maegan")
    maegan.destroy if maegan
    @maegan = User.new
    @maegan.name = "Maegan"
    @maegan.handle = "maebo"
    @maegan.password = "24356456789876546789"
    maria = User.find_by(name: "Maria")
    maria.destroy if maria
    @maria = User.new
    @maria.name = "Maria"
    @maria.handle = "macom"
    @maria.password = "34345656789087654324"
    unai = User.find_by(name: "Unai")
    unai.destroy if unai
    @unai = User.new
    @unai.name = "Unai"
    @unai.handle = "unagi"
    @unai.password = "validpassword"
  end

  it "should be valid with correct data" do
    expect(@sharon.valid?).to be_truthy
  end

  describe :name do
    it "should be invalid when the name is not present" do
      @maegan.name = nil
      expect(@maegan.valid?).to be_falsy
    end
  end

  describe :handle do
    it "should be invalid when the handle is not present" do
      @unai.password = nil
      expect(@unai.valid?).to be_falsy
    end
  end

  describe :password do
  it "should be invalid when not present" do
      @sharon.password = nil
      expect(@sharon.valid?).to be_falsy
    end
  end

  describe :password do
    it "the password should be invalid when not unique" do
    	# right now it matches sharon's
      @karen = User.new
      @karen.name = "karen"
      @karen.handle = "sharebear"
      @karen.password = "validpassword" 
      expect(@karen.valid?).to be_falsy
    end
end

  describe :password do
    it "the password should be at least 8 characters" do
      @karen = User.new
      @karen.name = "karen"
      @karen.handle = "knasty"
      @karen.password = "oops" 
      expect(@karen.valid?).to be be_falsy
 	end
 end

  describe :handle do
    it "should be invalid if not unique" do
      @sharon.save
      @karen = User.new
      @karen.name = "karen"
      @karen.handle = "sharebear"
      @karen.password = "92746392729303827281" 
      expect(@karen.valid?).to be_falsy
    end
  end
end

