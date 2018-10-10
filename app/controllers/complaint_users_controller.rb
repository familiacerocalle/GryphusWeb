class ComplaintUsersController < ApplicationController
  before_action :set_complaint_user, only: [:show, :edit, :update, :destroy]

  # GET /complaint_users
  # GET /complaint_users.json
  def index
    #@complaint_users = ComplaintUser.all
    @complaint_users = ComplaintUser.where(["user_id = ?", current_user.id]).order("created_at DESC")
  end

  # GET /complaint_users/1
  # GET /complaint_users/1.json
  def show
  end

  # GET /complaint_users/new
  def new
    @complaint_user = ComplaintUser.new
  end

  # GET /complaint_users/1/edit
  def edit
  end

  # POST /complaint_users
  # POST /complaint_users.json
  def create
    @complaint_user = ComplaintUser.new(complaint_user_params)

    respond_to do |format|
      if @complaint_user.save
        format.html { redirect_to @complaint_user, notice: 'La queja fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @complaint_user }
      else
        format.html { render :new }
        format.json { render json: @complaint_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaint_users/1
  # PATCH/PUT /complaint_users/1.json
  def update
    respond_to do |format|
      if @complaint_user.update(complaint_user_params)
        format.html { redirect_to @complaint_user, notice: 'La queja fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @complaint_user }
      else
        format.html { render :edit }
        format.json { render json: @complaint_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaint_users/1
  # DELETE /complaint_users/1.json
  def destroy
    @complaint_user.destroy
    respond_to do |format|
      format.html { redirect_to complaint_users_url, notice: 'La queja fue eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_user
      @complaint_user = ComplaintUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_user_params
      params.require(:complaint_user).permit(:complaint_id, :user_id, :direccion, :comentarios)
    end
end
