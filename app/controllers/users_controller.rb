
class UsersController < ApplicationController
	
	def create
        @user = User.new()
        email, password = user_params[:email], BCrypt::Password.create(user_params[:password])
        logger.info(password)
        name = email[0..email.index("@") - 1]
        @user.name = name
        @user.email = email
        @user.password = password
        if @user.save
        	# hmac_secret = Rails.application.credentials.dig(:development, :hmac_secret)
    		hmac_secret = "token$ignature$ecret"
        	payload = { "user_id": @user.id, "email": @user.email }
        	jwt_token = JWT.encode(payload, hmac_secret, 'HS256')
    	    response.headers['Authorization'] = "Bearer #{jwt_token}"
            render json: {message: "User Created Successfully", token: jwt_token}, status: :created
        else 
            render json: {errors: user.errors.full_messages} , status: :unprocessable_entity
        end
    end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
