require 'rails_helper'

#RSpec.describe School, :type => :model do
describe School do
  let(:school){ FactoryGirl.create(:school) }

  subject{ school }

  it{ should respond_to(:name) }
  it{ should respond_to(:address) }
  it{ should respond_to(:contact) }
  it{ should respond_to(:email) }

  it{ should be_valid }

  describe "when name is not present" do
    before{ school.name = "" }
    it{ should_not be_valid }
  end

  describe "when address is not present" do
    before{ school.address = "" }
    it{ should_not be_valid }
  end

  describe "when contact is not present" do
    before{ school.contact = "" }
    it{ should_not be_valid }
  end

  describe "when email is not present" do
    before{ school.email = "" }
    it{ should_not be_valid }
  end

  describe "when name is too long" do
    before{ school.name = "a" * 51 }
    it{ should_not be_valid }
  end

  describe "When contact is too long" do
    before{ school.contact = "a" * 51 }
    it{ should_not be_valid }
  end

  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                           foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        school.email = invalid_address
        expect(school).not_to be_valid
      end
    end
  end

  describe "when email is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        school.email = valid_address
        expect(school).to be_valid
      end
    end
  end
end
