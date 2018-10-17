class AddLocaleToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :locale, :string, default: 'en'
  end

  def down
    remove_column :users, :locale
  end
end
