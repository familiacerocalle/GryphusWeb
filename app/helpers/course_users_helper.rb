module CourseUsersHelper
  def enroll
    @inscripcion = CourseUser.new
    @inscripcion.course_id = params[:courseid]
    @inscripcion.user_id = params[:userid]
    @inscripcion.fechainicio = Time.now
    @inscripcion.save
    redirect_to course_users_show_act_path, notice: "Enrolled for course"
  end

  def finalizar
    @inscripcion = CourseUser.find(params[:id])
    @inscripcion.fechafin = Time.now
    @inscripcion.save
    redirect_to course_users_show_hist_path, notice: "Successfully completed the course"
  end
end
