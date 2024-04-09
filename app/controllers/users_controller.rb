class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @bookings = current_user.bookings
    end
    
    def new
        @user = User.new
      end
      
      def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new, status: :unprocessable_entity
        end
      end
    
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      end
        
      private 
      def user_params 
          params.require(:user).permit(:name, :email, :password)
      end
end
