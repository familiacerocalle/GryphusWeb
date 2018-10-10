class ChallengelevelsController < ApplicationController
  before_action :set_challengelevel, only: [:show, :edit, :update, :destroy]

  # GET /challengelevels
  # GET /challengelevels.json
  def index
    @challengelevels = Challengelevel.all
  end

  # GET /challengelevels/1
  # GET /challengelevels/1.json
  def show
  end

  # GET /challengelevels/new
  def new
    @challengelevel = Challengelevel.new
  end

  # GET /challengelevels/1/edit
  def edit
  end

  # POST /challengelevels
  # POST /challengelevels.json
  def create
    @challengelevel = Challengelevel.new(challengelevel_params)

    respond_to do |format|
      if @challengelevel.save
        format.html { redirect_to @challengelevel, notice: 'Challengelevel was successfully created.' }
        format.json { render :show, status: :created, location: @challengelevel }
      else
        format.html { render :new }
        format.json { render json: @challengelevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challengelevels/1
  # PATCH/PUT /challengelevels/1.json
  def update
    respond_to do |format|
      if @challengelevel.update(challengelevel_params)
        format.html { redirect_to @challengelevel, notice: 'Challengelevel was successfully updated.' }
        format.json { render :show, status: :ok, location: @challengelevel }
      else
        format.html { render :edit }
        format.json { render json: @challengelevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challengelevels/1
  # DELETE /challengelevels/1.json
  def destroy
    @challengelevel.destroy
    respond_to do |format|
      format.html { redirect_to challengelevels_url, notice: 'Challengelevel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challengelevel
      @challengelevel = Challengelevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challengelevel_params
      params.require(:challengelevel).permit(:descripcion, :puntos)
    end
end
