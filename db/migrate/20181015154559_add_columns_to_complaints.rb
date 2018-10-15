class AddColumnsToComplaints < ActiveRecord::Migration[5.2]
  def up
    add_column :complaints, :user_id, :integer
    add_column :complaints, :complaint_type_id, :integer
  end

  def down
    remove_column :complaints, :user_id
    remove_column :complaints, :complaint_type_id
  end
end
