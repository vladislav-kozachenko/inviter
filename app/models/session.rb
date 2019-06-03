class Session < ApplicationRecord
  belongs_to :user

  validates_presence_of :user, :token, :expiration
  validates_uniqueness_of :token
  before_validation :ensure_token

  def extend_expiration
    self.expiration = Time.current + 1.month
  end

  private

  def ensure_token
    self.token = generate_token
    extend_expiration
  end

  def generate_token
    loop do
      token = Devise.friendly_token
      break token unless Session.where(token: token).first
    end
  end
end
