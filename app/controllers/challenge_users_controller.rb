class ChallengeUsersController < ApplicationController
  before_action :set_challenge_user, only: [:show, :edit, :update, :destroy]
  include ChallengeUsersHelper

  # GET /challenge_users
  # GET /challenge_users.json
  def index
    @challenge_users = ChallengeUser.all
  end

  # Lista de cursos disponibles para un usuario (los cursos a los que no está asociado)
  def show_disp
    @challengesdisp = Challenge.where(["id NOT IN (SELECT challenge_id FROM challenge_users WHERE user_id = ?)", current_user.id])
  end

  # Lista de cursos actuales (los cursos a los que está asociado y no ha terminado)
  def show_act
    @challengeusers = ChallengeUser.where(["user_id = ? AND fechaFin IS NULL", current_user.id]).order("created_at DESC")
  end

  # Lista de cursos finalizados (los cursos a los que está asociado y ya terminó)
  def show_hist
    @challengeusers = ChallengeUser.where(["user_id = ? AND fechaFin IS NOT NULL", current_user.id]).order("created_at DESC")
  end

  # GET /challenge_users/1
  # GET /challenge_users/1.json
#/*-  def show
#/*-  end

  # GET /challenge_users/new
  def new
    @challenge_user = ChallengeUser.new
  end

  # GET /challenge_users/1/edit
#/*-  def edit
#/*-  end

  # POST /challenge_users
  # POST /challenge_users.json
  def create
    @challenge_user = ChallengeUser.new(challenge_user_params)

    respond_to do |format|
      if @challenge_user.save
        format.html { redirect_to @challenge_user, notice: 'Challenge user was successfully created.' }
        format.json { render :show, status: :created, location: @challenge_user }
      else
        format.html { render :new }
        format.json { render json: @challenge_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenge_users/1
  # PATCH/PUT /challenge_users/1.json
#/*-  def update
#    respond_to do |format|
#      if @challenge_user.update(challenge_user_params)
#        format.html { redirect_to @challenge_user, notice: 'Challenge user was successfully updated.' }
#        format.json { render :show, status: :ok, location: @challenge_user }
#      else
#        format.html { render :edit }
#        format.json { render json: @challenge_user.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /challenge_users/1
  # DELETE /challenge_users/1.json
  def destroy
    @challenge_user.destroy
    respond_to do |format|
      format.html { redirect_to challenge_users_url, notice: 'Challenge user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_user
      @challenge_user = ChallengeUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_user_params
      params.require(:challenge_user).permit(:challenge_id, :user_id, :fechainicio, :fechafin)
    end
end
