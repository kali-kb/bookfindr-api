class Book < ApplicationRecord
	has_many :saved_book, dependent: :destroy

	def self.initial_list
		Book.where('id <= ?', 4)
	end
 	

	def is_saved(user_id)
		return self.saved_book.where(user_id: user_id).any?
	end


end
