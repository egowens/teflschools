FactoryGirl.define do
  factory :school do
    name      "A-B-C TEFL"
    address   "123 Fake st. Europe city, Europe, 12345"
    contact   "Mr. T Efl"
    email     "mail@abctefl.com"
  end

  factory :user do
    email     "Teacher@example.com"
    password  "foobarbaz"
  end
end
