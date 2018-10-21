module Api
  module V1
    class UsersController < ActionController::API

      before_action :custom_authenticate_user!, only: [:sign_out, :update]

      def signup
        # Crea un usuario y devuelve sus datos
        @user = User.new(user_params)
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password]
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def signin
        @user = User.where(email: params[:email]).first
        render json: { errors: ['Invalidate email/password'] }, status: :unprocessable_entity and return unless @user
        if @user.valid_password?(params[:password])
          @user.reset_authentication_token
          render json: @user, status: :created
        else
          render json: { errors: ['Invalidate email/password'] }, status: :unprocessable_entity
        end
      end

      def update
        if @current_user.update(user_params).save
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def sign_out
        if @current_user.logout
          render json: :null, status: :ok
        else
          render json: { errors: ['Token already Invalidate'] }, status: :not_found
        end
      end

      private

        def user_params
          params.require(:user).permit(:email, :password, :nombre, :primerApellido, :segundoApellido, :puntosAcumulados)
        end
    end
  end
end
