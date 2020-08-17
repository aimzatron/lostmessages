class CreateProjects < ActiveRecord::Migration[5.1]
  enable_extension 'uuid-ossp'

  def change
    create_table :projects, id: :uuid, default: "uuid_generate_v4()"
  end
end
