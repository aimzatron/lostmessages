FactoryBot.define do
  factory :project_message do
    project
    message_id { rand(1..100_000) }
    key { 1 }
  end
end
