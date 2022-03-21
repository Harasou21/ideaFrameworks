require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { FactoryBot.build(:user) }
  let(:invalid_user) { FactoryBot.build(:user, :every_invalid) }

  context "ユーザー新規登録ができるとき" do
    it "正しい情報だとユーザー新規登録ができる" do
      visit new_user_path
      fill_in 'user[name]',                  with: user.name
      fill_in 'user[email]',                 with: user.email
      fill_in 'user[password]',              with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation

      expect do 
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
    end
  end

  context "ユーザー新規登録ができないとき" do 
    it "誤った情報では新規登録ができずに、新規登録ページへリダイレクト" do 
      visit new_user_path
      fill_in 'user[name]',                  with: invalid_user.name
      fill_in 'user[email]',                 with: invalid_user.email
      fill_in 'user[password]',              with: invalid_user.password
      fill_in 'user[password_confirmation]', with: invalid_user.password_confirmation

      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)

      expect(current_path).to eq("/users")
    end
  end
end
