class ProjectMessage < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :message_id, :project_id, :key
  validates_inclusion_of :key, in: 1..71
end
