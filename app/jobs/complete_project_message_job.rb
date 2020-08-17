class CompleteProjectMessageJob < ApplicationJob
  queue_as :default

  def perform
    complete_projects
  end

  def complete_projects
    project_messages = ProjectMessage.select('MAX(created_at) as max_created_at, project_id').group(:project_id).map(&:project_id)
    Project.incomplete.joins(:project_messages).where('projects.id IN (?)', project_messages).update_all(project_complete: true)
  end
end
