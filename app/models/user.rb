class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, through: :project_users
  has_and_belongs_to_many :locations
end
