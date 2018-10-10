class CreateComplaintfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :complaintfiles do |t|
      t.references :complaint_user, foreign_key: true
      t.string :descripcion
      t.string :archivo

      t.timestamps
    end
  end
end
