module Api
  module V1
    class CourseUsersController < ActionController::API
      before_action :custom_authenticate_user!

      include CourseUsersHelper
      include ActionController::HttpAuthentication::Token::ControllerMethods

      # Lista de cursos disponibles para un usuario (los cursos a los que no está asociado)
      def show_disp
        @courses = Course.where(["id NOT IN (SELECT course_id FROM course_users WHERE user_id = ?)", @current_user.id])
        render json: {cursos: @courses}, status: :ok
      end

      def show
        @course = Course.find_by(id: params[:id])
        render json: @course.as_json(include: [:attachments]), status: :ok
      end

      # Lista de cursos actuales (los cursos a los que está asociado y no ha terminado)
      def show_act
        @courseusers = CourseUser.where(["user_id = ? AND fechaFin IS NULL", @current_user.id]).order("created_at DESC")
        render json: {cursos: @courseusers.as_json(include: [:course])}
      end

      # Lista de cursos finalizados (los cursos a los que está asociado y ya terminó)
      def show_hist
        @courseusers = CourseUser.where(["user_id = ? AND fechaFin IS NOT NULL", @current_user.id]).order("created_at DESC")
        render json: {cursos: @courseusers.as_json(include: [:course])}
      end

      def inscribircurso
        enroll('api')
        render json: {courseuser: @inscripcion}, status: :ok
      end

      def finalizarcurso
        finalizar('api')
        render json: {courseuser: @inscripcion}, status: :ok
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
