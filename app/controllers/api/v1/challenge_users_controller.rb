module Api
  module V1
    class ChallengeUsersController < ActionController::API
      before_action :custom_authenticate_user!
      include ActionController::HttpAuthentication::Token::ControllerMethods
      include ChallengeUsersHelper

      def show_disp
        @challengesdisp = Challenge.where(["id NOT IN (SELECT challenge_id FROM challenge_users WHERE user_id = ?)", @current_user.id])
        render json: @challengesdisp, status: :ok
      end

      def show_act
        @challengeusers = ChallengeUser.where(["user_id = ? AND fechaFin IS NULL", @current_user.id]).order("created_at DESC")
        render json: @challengeusers.as_json(include: [:challenge])
      end

      def show
        @challenge = Challenge.find_by(id: params[:id])
        @challenge_user = ChallengeUser.where(user_id: @current_user.id, challenge_id: @challenge.id).last
        render json: @challenge.as_json(include: [:attachments]).merge(challenge_user: @challenge_user), status: :ok
      end

      def show_hist
        @challengeusers = ChallengeUser.where(["user_id = ? AND fechaFin IS NOT NULL", @current_user.id]).order("created_at DESC")
        render json: @challengeusers.as_json(include: [:challenge])
      end

      def inscribirreto
        enroll('api')
        render json: @inscripcion, status: :ok
      end

      def finalizarreto
        finalizar('api')
        render json: @inscripcion, status: :ok
      end

      private
        def custom_authenticate_user!
          authenticate_or_request_with_http_token do |token, options|
            @current_user = User.find_by(token: token)
          end
        end

    end
  end
end
