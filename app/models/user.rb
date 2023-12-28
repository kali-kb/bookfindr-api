class User < ApplicationRecord
	validates :name, :email, :password, presence: true
	has_many :saved_book
end


