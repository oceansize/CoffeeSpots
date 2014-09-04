class Coffeespot < ActiveRecord::Base

	belongs_to :user, inverse_of: :coffeespots
	validates_presence_of :user

	has_many :reviews

	validates :name, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }

	validates :url, presence: true, allow_blank: false

end

