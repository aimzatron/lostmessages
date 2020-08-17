require 'rails_helper'

RSpec.describe CompleteProjectMessageJob, type: :job do
  describe "#perform" do
    it "enqueues a job " do
      ActiveJob::Base.queue_adapter = :test
      expect {
        CompleteProjectMessageJob.perform_later
      }.to have_enqueued_job
    end
  end
  describe "complete_projects" do
    it "should complete a project" do
      project = Project.create()
      project_message = ProjectMessage.create(project: project, key: 1, message_id: 1, created_at: 2.minutes.ago)
      CompleteProjectMessageJob.perform_later.complete_projects
      project.reload
      expect(project.project_complete).to be_truthy
    end
  end
end
