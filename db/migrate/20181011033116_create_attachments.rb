class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :file
      t.belongs_to :entity, polymorphic: true
      t.timestamps
    end
    add_index :attachments, [:entity_id, :entity_type]
  end
end
