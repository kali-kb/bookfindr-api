class SavedBooksController < ApplicationController

	#filters

	before_action :authorize_request 


	def index
		user_id = @current_user.id
		saved_books = Book.joins(:saved_book).where(saved_book: { user_id: user_id })
		render json: saved_books, status: :ok
	end



	def create
		jwt_token = request.headers['Authorization']&.split('Bearer ')&.last
	    decoded_token = decode_jwt(jwt_token)
	    user_id = decoded_token['user_id']
		saved_book = SavedBook.new
		if Book.exists? title: saved_book_params[:book][:title]
			logger.info("exists")
			book = Book.find_by(title: saved_book_params[:book][:title])
			saved_book.user_id = user_id
			saved_book.book_id = book.id
			if saved_book.save
				render json: {status: :created}
			else
				logger.info(saved_book.errors.full_messages)
				render json: { errors: saved_book.errors.full_messages }, status: :unprocessable_entity
			end
		else
			logger.info("doesnt exist")
			book = Book.create(saved_book_params[:book])
			saved_book.user_id = user_id
			saved_book.book_id = book.id
			if saved_book.save
				render json: {status: :created}
			else
				logger.info(saved_book.errors.full_messages)
				render json: { errors: saved_book.errors.full_messages }, status: :unprocessable_entity
			end
		end

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

	def saved_book_params
		# params.require(:save_book_data).permit(:user_id, book: [:title, :download_link, :cover, :author])
		params.require(:save_book_data).permit(book: [:title, :download_link, :cover, :author])		
	end



	def destroy
		user_id = @current_user.id
		user = User.find_by(id: user_id)
		user.saved_book.find_by(id:params[:id]).delete
		head :no_content		
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


		def destroy_all
			user_id = @current_user.id
			user = User.find_by(id: user_id)
			user.saved_book.destroy_all
			head :no_content
		end

end
