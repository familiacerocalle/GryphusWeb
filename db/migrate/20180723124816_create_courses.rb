class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :nombre
      t.text :contenido
      t.integer :puntos

      t.timestamps
    end
  end
end
