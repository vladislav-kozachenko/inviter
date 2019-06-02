class Project < ApplicationRecord
  has_many :users, through: :project_users
  has_and_belongs_to_many :locations
end
