module ChallengeUsersHelper
  def enroll
    @inscripcion = ChallengeUser.new
    @inscripcion.challenge_id = params[:challengeid]
    @inscripcion.user_id = params[:userid]
    @inscripcion.fechainicio = Time.now
    @inscripcion.save
    redirect_to challenge_users_show_act_path, notice: t(:challenge_enrolled)
  end

  def finalizar
    @inscripcion = ChallengeUser.find(params[:id])
    @inscripcion.fechafin = Time.now
    @inscripcion.save
    redirect_to challenge_users_show_act_path, notice: t(:challenge_complete)
  end
end
