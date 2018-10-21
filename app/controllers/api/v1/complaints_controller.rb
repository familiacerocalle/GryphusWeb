module Api
  module V1
    class ComplaintsController < ActionController::API
      before_action :custom_authenticate_user!
      before_action :set_complaint, only: [:show, :update]

      def index
        @complaints = @current_user.complaints
        render json: @complaints, status: :ok
      end

      def complaint_types
        @complaint_types = ComplaintType.pluck(:name, :id)
        render json: @complaint_types, status: :ok
      end

      def show
        render json: {quejas: @complaint.as_json(include: [:attachments, :complaint_files])}, status: :ok
      end

      def create
        @complaint = Complaint.new(complaint_params)
        @complaint.attachments.build(file: params[:files]) if params[:files]

        if @complaint.save
          render json: @complaint.as_json(include: [:attachments, :complaint_files]), status: :created
        else
          render json: @complaint.errors, status: :unprocessable_entity
        end
      end

      def update
        if params[:files]
          @complaint.attachments = [Attachment.new(file: params[:files])]
        end
        if @complaint.update(complaint_user_params)
          render json: @complaint.as_json(include: [:attachments, :complaint_files]), status: :ok
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
          params.require(:complaint).permit(:descripcion, :complaint_type_id, :user_id, attachments_attributes: [:file])
        end
    end
  end
end
