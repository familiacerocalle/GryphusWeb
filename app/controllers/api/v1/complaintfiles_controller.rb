module Api
  module V1
    class ComplaintfilesController < ActionController::API
      before_action :custom_authenticate_user!
      before_action :set_complaint_file, only: [:update]

      def create
        @complaintfile = Complaintfile.new(complaintfile_params)

        if @complaintfile.save
          render json: @complaintfile, status: :created
        else
          render json: @complaintfile.errors, status: :unprocessable_entity
        end
      end

      def update
        if @complaintfile.update(complaintfile_params)
          render json: @complaintfile, status: :ok
        else
          render json: @complaintfile.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_complaint_file
          @complaintfile = Complaintfile.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def complaintfile_params
          params.require(:complaintfile).permit(:complaint_id, :descripcion, :archivo, :user_id)
        end
    end
  end
end
