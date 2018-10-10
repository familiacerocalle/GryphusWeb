class CreateChallengelevels < ActiveRecord::Migration[5.2]
  def change
    create_table :challengelevels do |t|
      t.string :descripcion
      t.integer :puntos

      t.timestamps
    end
  end
end
