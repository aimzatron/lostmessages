class AddColumnsToProjectMessage < ActiveRecord::Migration[5.1]
  enable_extension 'uuid-ossp'

  create_table :project_messages do |t|
    t.bigint :message_id
    t.uuid :project_id, :uuid, default: "uuid_generate_v4()", null: false
    t.integer :key
  end
end
