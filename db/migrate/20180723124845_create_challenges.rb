class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :challengelevel, foreign_key: true
      t.string :descripcion

      t.timestamps
    end
  end
end
