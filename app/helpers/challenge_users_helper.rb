module ChallengeUsersHelper
  def inscribir
    @inscripcion = ChallengeUser.new
    @inscripcion.challenge_id = params[:challengeid]
    @inscripcion.user_id = params[:userid]
    @inscripcion.fechainicio = Time.now
    @inscripcion.save
  end

  def finalizar
    @inscripcion = ChallengeUser.find(params[:id])
    @inscripcion.fechafin = Time.now
    @inscripcion.save
  end
end
