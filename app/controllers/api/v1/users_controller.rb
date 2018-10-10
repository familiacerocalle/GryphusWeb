module Api
  module V1
    class UsersController < ActionController::API
      def index
        @user = User.order('created_at DESC')

        render json: @user
      end
      def signup
        # Crea un usuario y devuelve sus datos
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def signin
        # Si encuentra al usuario devuelve sus datos
        @user = User.find_by(email: params[:user][:email])
        #Texto para probar flujo: render json: @user, status: :not_found
        if @user.nil?
          render json: @user, status: :not_found
        else
          render json: @user, status: :ok
        end
      end

      private
      def user_params
        params.require(:user).permit(:email, :password)
        #params.require(:user).permit(:nombre, :primerApellido, :segundoApellido, :puntosAcumulados)

      end
    end
  end
end
