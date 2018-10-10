module CourseUsersHelper
  def inscribir
    @inscripcion = CourseUser.new
    @inscripcion.course_id = params[:courseid]
    @inscripcion.user_id = params[:userid]
    @inscripcion.fechainicio = Time.now
    @inscripcion.save
  end

  def finalizar
    @inscripcion = CourseUser.find(params[:id])
    @inscripcion.fechafin = Time.now
    @inscripcion.save
  end
end
