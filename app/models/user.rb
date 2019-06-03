class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users
  has_and_belongs_to_many :locations
  has_many :sessions

  belongs_to :invited_by, polymorphic: true
end
