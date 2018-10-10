class CreateComplaintUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_users do |t|
      t.references :complaint, foreign_key: true
      t.references :user, foreign_key: true
      t.string :direccion
      t.string :comentarios

      t.timestamps
    end
  end
end
