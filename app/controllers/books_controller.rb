
class BooksController < ApplicationController
	# GET /books

	before_action :authorize_request

	def index
		@books = Book.initial_list
		@user_id = @current_user.id
		render 'books/index' #for modified json structure using jbuilder
	end



	def authorize_request
	    header = request.headers['Authorization']
	    header = header.split(' ').last if header
	    begin
	      decoded = decode_jwt(header)
	      @current_user = User.find(decoded["user_id"])
	    rescue ActiveRecord::RecordNotFound => e
	      render json: { error: e.message }, status: :unauthorized
	    rescue JWT::DecodeError => e
	      render json: { error: e.message }, status: :unauthorized
	    end
	end


	def search
		search_term = params[:query]
		scraper = BookScraper.new(search_term)
		books_list = scraper.get_books
		render json: books_list
	end


	private

		def decode_jwt(token)
	    	return nil unless token

	    	begin
	    		hmac_secret = "token$ignature$ecret"
	      		# secret_key = Rails.application.secrets.secret_key_base
	      		JWT.decode(token, hmac_secret, true, algorithm: 'HS256').first
	    	rescue JWT::DecodeError
	      		nil
	    	end
	  	end

end
