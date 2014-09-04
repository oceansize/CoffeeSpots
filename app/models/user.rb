class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :coffeespots, inverse_of: :user
  accepts_nested_attributes_for :coffeespots

  has_many :reviews, inverse_of: :user
  accepts_nested_attributes_for :reviews

end
