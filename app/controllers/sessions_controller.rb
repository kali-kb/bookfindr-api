class SessionsController < ApplicationController

	def create
	    if User.exists?(email: user_params[:email])
	        @user = User.find_by(email: user_params[:email])
	        # if user_params[:password].to_i == BCrypt::Password.new(@user.password)
	        logger.info(user_params[:password])
	        if BCrypt::Password.new(@user.password) == user_params[:password] 
	        	# hmac_secret = Rails.application.credentials.hmac_secret.development!
            	hmac_secret = "token$ignature$ecret"
	        	logger.info(hmac_secret)
	        	payload = { "user_id": @user.id, "username": @user.name, "email": @user.email }
	        	jwt_token = JWT.encode(payload, hmac_secret, 'HS256')
	    	    response.headers['Authorization'] = "Bearer #{jwt_token}"
	            render json: {message: "Logged in succesfully", token: jwt_token}, status: :ok
	        else
	            render json: {errors: "Password doesnt match"}, status: :unprocessable_entity
	        end
	    else
	        render json: {errors: "Email doesnt exist"}, status: :unprocessable_entity
	    end
	end


    def user_params
        # params.require(:user).permit(:email, :password)
        params.require(:user).permit(:email, :password).tap do |whitelisted|
            whitelisted[:password] = params[:user][:password]
        end
    end

end
