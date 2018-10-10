class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :primerApellido
      t.string :segundoApellido
      t.integer :puntosAcumulados

      t.timestamps
    end
  end
end
