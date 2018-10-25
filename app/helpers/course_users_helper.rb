module CourseUsersHelper
  def enroll(type = 'web')
    @inscripcion = CourseUser.new
    @inscripcion.course_id = params[:courseid]
    @inscripcion.user_id = params[:userid]
    @inscripcion.fechainicio = Time.now
    @inscripcion.save
    if type == 'web'
      redirect_to course_users_show_act_path, notice: t(:course_enrolled)
    end
  end

  def finalizar(type = 'web')
    @inscripcion = CourseUser.find(params[:id])
    @inscripcion.fechafin = Time.now
    @inscripcion.save
    if type == 'web'
      redirect_to course_users_show_hist_path, notice: t(:course_complete)
    end
  end
end
