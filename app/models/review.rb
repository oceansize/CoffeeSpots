class Review < ActiveRecord::Base

	belongs_to :coffeespot, inverse_of: :reviews
	validates_presence_of :coffeespot


	belongs_to :user, inverse_of: :reviews
	validates_presence_of :user

	validates :thoughts, presence: true, allow_blank: false

end

