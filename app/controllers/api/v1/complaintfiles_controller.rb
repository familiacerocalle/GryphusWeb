module Api
  module V1
    class ComplaintfilesController < ActionController::API
      before_action :set_complaintfile, only: [:show, :edit, :update, :destroy]

      # GET /complaintfiles
      # GET /complaintfiles.json
      def index
        #@complaintfiles = Complaintfile.all
        @complaintfilesqueja = Complaintfile.where(["complaint_user_id = ?", params[:idqueja]]).order("created_at ASC")
        @idqueja = params[:idqueja]
        render json: {archivos: @complaintfilesqueja}, status: :ok
      end

      # GET /complaintfiles/1
      # GET /complaintfiles/1.json
      def show
        render json: {archivos: @complaintfile}, status: :ok
      end

      # GET /complaintfiles/new
      def new
        @idqueja = params[:idqueja]
        @complaintfile = Complaintfile.new
        @complaintfile.complaint_user_id = @idqueja
        render json: {archivos: @complaintfile}, status: :ok
      end

      # GET /complaintfiles/1/edit
      def edit
      end

      # POST /complaintfiles
      # POST /complaintfiles.json
      def create
        @complaintfile = Complaintfile.new(complaintfile_params)

        if @complaintfile.save
          render json: @complaintfile, status: :created
        else
          render json: @complaintfile.errors, status: :unprocessable_entity
        end

        #respond_to do |format|
        #  if @complaintfile.save
        #    format.html { redirect_to @complaintfile, notice: 'Complaintfile was successfully created.' }
        #    format.json { render :show, status: :created, location: @complaintfile }
        #  else
        #    format.html { render :new }
        #    format.json { render json: @complaintfile.errors, status: :unprocessable_entity }
        #  end
        #end
      end

      # PATCH/PUT /complaintfiles/1
      # PATCH/PUT /complaintfiles/1.json
      def update
        if @complaintfile.update(complaintfile_params)
          render json: @complaintfile, status: :ok
        else
          render json: @complaintfile.errors, status: :unprocessable_entity
        end

        #respond_to do |format|
        #  if @complaintfile.update(complaintfile_params)
        #    format.html { redirect_to @complaintfile, notice: 'Complaintfile was successfully updated.' }
        #    format.json { render :show, status: :ok, location: @complaintfile }
        #  else
        #    format.html { render :edit }
        #    format.json { render json: @complaintfile.errors, status: :unprocessable_entity }
        #  end
        #end
      end

      # DELETE /complaintfiles/1
      # DELETE /complaintfiles/1.json
      def destroy
        @complaintfile.destroy

        render status: :ok, json: {archivos: nil.as_json}
        #respond_to do |format|
        #  format.html { redirect_to complaintfiles_url, notice: 'Complaintfile was successfully destroyed.' }
        #  format.json { head :no_content }
        #end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_complaintfile
          @complaintfile = Complaintfile.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def complaintfile_params
          params.require(:complaintfile).permit(:complaint_user_id, :descripcion, :archivo)
        end
    end
  end
end
