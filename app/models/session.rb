class Session < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :token, :expiration
  validates_uniqueness_of :token
  before_validation :ensure_token

  private

  def ensure_token
    self.token = generate_token
    self.expiration = Time.current+1.month
  end

  def generate_token
    loop do
      token = Devise.friendly_token
      break token unless Session.where(token: token).first
    end
  end
end
