class AddColumnBlockedAndBlockedAtToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :blocked, :boolean, default: false
    add_column :users, :blocked_at, :timestamp
  end

  def down
    remove_column :users, :blocked
    remove_column :users, :blocked_at
  end
end
