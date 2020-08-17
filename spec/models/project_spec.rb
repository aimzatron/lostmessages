require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:project_messages) }

  describe ".convert_project_messages" do
    let(:project) { create(:project) }
    let(:project_message1) { create(:project_message, key: 2, message_id: 2, project: project) }
    let(:project_message2) { create(:project_message, key: 20, message_id: 5, project: project) }
    let(:project_message3) { create(:project_message, key: 21, message_id: 1, project: project) }
    let(:project_message4) { create(:project_message, key: 4, message_id: 3, project: project) }
    let(:project_message5) { create(:project_message, key: 16, message_id: 4, project: project) }
    it "returns a message when messages are present" do
      project_message1
      project_message2
      project_message3
      project_message4
      project_message5
      expect(project.convert_project_messages).to eq "tacos"
    end
  end
end
