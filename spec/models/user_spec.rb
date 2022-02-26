require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryBot.build(:user)}
  let(:user_but_empty_name)      { FactoryBot.build(:user, :but_empty_name) }
  let(:user_but_empty_email)     { FactoryBot.build(:user, :but_empty_email) }
  let(:user_but_have_long_name)  { FactoryBot.build(:user, :but_have_long_name) }
  let(:user_but_have_long_email) { FactoryBot.build(:user, :but_have_long_email) }

  describe "check user's validations" do
    it "shoule be valid" do
      expect(user).to be_valid
    end

    it "name should be present" do
      expect(user_but_empty_name).not_to be_valid
    end

    it "email should be present" do
      expect(user_but_empty_email).not_to be_valid
    end

    it "name should not be too long" do
      expect(user_but_have_long_email).not_to be_valid
    end

    it "email should not be too long" do
      expect(user_but_have_long_email).not_to be_valid
    end

    it "email valodation should accept valid addresses" do
      valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.cn)
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid 
      end
    end

    it "email valodation should not accept invalid addresses" do
      invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com)
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to be_invalid
      end
    end

    it "email addresses should be unique" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com") 
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "emailにおいて、大文字と小文字の区別はしない" do
      
    end
  end
end
