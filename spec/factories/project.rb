FactoryBot.define do
  factory :project, class: Project do
    sequence(:name) { |n| "Sample Name #{n}" }
  end
end
