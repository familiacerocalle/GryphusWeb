class CreateCourseUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_users do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :fechainicio
      t.datetime :fechafin

      t.timestamps
    end
  end
end
