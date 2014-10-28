require 'rails_helper'

#RSpec.describe User, :type => :model do

describe User do
  let(:user){ FactoryGirl.create(:user) }

  subject{ user }

  it{ should respond_to(:email) }
  it{ should respond_to(:password) }

  it{ should be_valid }

  describe "when email is not present" do
    before{ user.email = "" }
    it{ should_not be_valid }
  end

  describe "when password is not present" do
    before{ user.password = "" }
    it{ should_not be_valid }
  end

  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                           foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end
end
