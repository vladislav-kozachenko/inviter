require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should require email' do
    is_expected.to validate_presence_of(:email)
  end

  it 'should require password' do
    is_expected.to validate_presence_of(:password)
  end

  it 'should validate email' do
    is_expected.not_to allow_value('not valid email').for(:email)
    is_expected.not_to allow_value('not_valid@@email').for(:email)
    is_expected.not_to allow_value('email.ru').for(:email)
    is_expected.not_to allow_value('@email.ru').for(:email)
    is_expected.to allow_value('123.user@email.com.ru').for(:email)
  end

  it 'should have unique email' do
    is_expected.to validate_uniqueness_of(:email).case_insensitive
  end

  it 'should validate password' do
    is_expected.to validate_length_of(:password).is_at_least(6)
  end

  it 'should accept valid email and password' do
    user = build(:user_registration)
    expect(user).to be_valid
  end
end
