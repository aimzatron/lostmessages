require 'rails_helper'

RSpec.describe ProjectMessage, type: :model do
  it { should belong_to(:project) }
  it { should validate_presence_of(:message_id) }
  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:key) }
  it { should validate_inclusion_of(:key).in_range(1..71) }
end
