module Api
  module V1
    class ComplaintsController < ActionController::API
      before_action :custom_authenticate_user!
      before_action :set_complaint, only: [:show, :update]
      include ActionController::HttpAuthentication::Token::ControllerMethods

      def index
        @complaints = @current_user.complaints
        render json: @complaints, status: :ok
      end

      def complaint_types
        @complaint_types = ComplaintType.pluck(:name, :id)
        render json: @complaint_types, status: :ok
      end

      def show
        render json: {quejas: @complaint.as_json(include: [:attachments, :complaintfiles])}, status: :ok
      end

      def create
        @complaint = Complaint.new(complaint_params)
        @complaint.attachments.build(file: params[:files]) if params[:files]

        if @complaint.save
          render json: @complaint.as_json(include: [:attachments, :complaintfiles]), status: :created
        else
          render json: @complaint.errors, status: :unprocessable_entity
        end
      end

      def update
        if params[:files]
          @complaint.attachments = [Attachment.new(file: params[:files])]
        end
        if @complaint.update(complaint_params)
          render json: @complaint.as_json(include: [:attachments, :complaintfiles]), status: :ok
        else
          render json: @complaint.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_complaint
          @complaint = Complaint.find(params[:id])
        end

        def complaint_params
          params.require(:complaint).permit(:descripcion, :complaint_type_id, :user_id)
        end

        def custom_authenticate_user!
          authenticate_or_request_with_http_token do |token, options|
            @current_user = User.find_by(token: token)
          end
        end

    end
  end
end
