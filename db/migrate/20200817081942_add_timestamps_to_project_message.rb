class AddTimestampsToProjectMessage < ActiveRecord::Migration[5.1]
  def change
    change_table :project_messages do |t|
      t.timestamps
    end
  end
end
