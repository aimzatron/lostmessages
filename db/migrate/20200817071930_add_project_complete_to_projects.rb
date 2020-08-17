class AddProjectCompleteToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :project_complete, :boolean, default: false
  end
end
