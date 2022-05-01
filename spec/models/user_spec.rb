require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:user_but_empty_name)                      { FactoryBot.build(:user, :but_empty_name) }
  let(:user_but_empty_email)                     { FactoryBot.build(:user, :but_empty_email) }
  let(:user_but_have_long_name)                  { FactoryBot.build(:user, :but_have_long_name) }
  let(:user_but_have_long_email)                 { FactoryBot.build(:user, :but_have_long_email) }
  let(:user_but_have_empty_password)             { FactoryBot.build(:user, :but_have_empty_password) }
  let(:user_but_have_less_5_characters_password) { FactoryBot.build(:user, :but_have_less_5_characters_password) }

  describe "check user's validations" do
    it "shoule be valid" do
      expect(user).to be_valid
    end

    it "name should be present" do
      user = user_but_empty_name
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it "email should be present" do
      user = user_but_empty_email
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "name should not be too long" do
      user = user_but_have_long_name
      user.valid?
      expect(user.errors.full_messages).to include("Name is too long (maximum is 50 characters)")
    end

    it "email should not be too long" do
      user = user_but_have_long_email
      user.valid?
      expect(user.errors.full_messages).to include("Email is too long (maximum is 255 characters)")
    end

    it "email valodation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it "email valodation should not accept invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
    end

    it "email addresses should be unique" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailにおいて、大文字と小文字の区別はしない" do
    end

    it "password should be present(nonblank)" do
      user = user_but_have_empty_password
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank",
                                                   "Password is too short (minimum is 6 characters)", "Password can't be blank")
    end

    it "password should be have a minimum length" do
      user = user_but_have_less_5_characters_password
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
