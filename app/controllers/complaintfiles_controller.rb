class ComplaintfilesController < ApplicationController
  before_action :set_complaintfile, only: [:show, :edit, :update, :destroy]

  # GET /complaintfiles
  # GET /complaintfiles.json
  def index
    @complaintfiles = Complaintfile.all
    @complaintfilesqueja = Complaintfile.where(["complaint_user_id = ?", params[:idqueja]]).order("created_at ASC")
    @idqueja = params[:idqueja]
  end

  # GET /complaintfiles/1
  # GET /complaintfiles/1.json
  def show
  end

  # GET /complaintfiles/new
  def new
    @idqueja = params[:idqueja]
    @complaintfile = Complaintfile.new
    @complaintfile.complaint_user_id = @idqueja
  end

  # GET /complaintfiles/1/edit
  def edit
  end

  # POST /complaintfiles
  # POST /complaintfiles.json
  def create
    @complaintfile = Complaintfile.new(complaintfile_params)

    respond_to do |format|
      if @complaintfile.save
        format.html { redirect_to @complaintfile, notice: 'Complaintfile was successfully created.' }
        format.json { render :show, status: :created, location: @complaintfile }
      else
        format.html { render :new }
        format.json { render json: @complaintfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaintfiles/1
  # PATCH/PUT /complaintfiles/1.json
  def update
    respond_to do |format|
      if @complaintfile.update(complaintfile_params)
        format.html { redirect_to @complaintfile, notice: 'Complaintfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaintfile }
      else
        format.html { render :edit }
        format.json { render json: @complaintfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaintfiles/1
  # DELETE /complaintfiles/1.json
  def destroy
    @complaintfile.destroy
    respond_to do |format|
      format.html { redirect_to complaintfiles_url, notice: 'Complaintfile was successfully destroyed.' }
      format.json { head :no_content }
    end
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
