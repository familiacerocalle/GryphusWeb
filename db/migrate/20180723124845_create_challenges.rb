class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.references :challengelevel, foreign_key: true
      t.text :descripcion

      t.timestamps
    end
  end
end
