class AddIndexToProjectMessages < ActiveRecord::Migration[5.1]
  def change
    add_index :project_messages, [:project_id, :message_id, :key], :unique => true
    add_index :project_messages, :project_id
  end
end
