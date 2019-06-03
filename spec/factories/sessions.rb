FactoryBot.define do
  factory :session do
    token "MyString"
    expiration "2019-06-03 11:20:55"
    user nil
  end
end
