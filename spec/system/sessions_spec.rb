require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  context "ユーザー登録した場合" do
    let!(:user) { create(:user) }

    it "ログインできる" do
      visit login_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_on 'ログイン'
      expect(page).to have_current_path("/users/#{user.id}")
      expect(page).to have_content(user.name)
      expect(page).to have_link "ログアウト", href: "/logout"
    end

    it "ログイン状態であること" do
      post login_path, params: { session: { email:    user.email,
                                            password: user.password } }
      expect(is_logged_in?).to be_truthy
    end

    it "ログインしたあとにログアウトできる" do
      post login_path, params: { session: { email:    user.email,
                                            password: user.password } }
      expect(is_logged_in?).to be_truthy
      visit user_path(user)
      expect(page).to have_content(user.name)
      expect(page).to have_link "ログアウト", href: "/logout"
      delete logout_path
      expect(is_logged_in?).not_to be_truthy
    end
  end

  context "ユーザー登録してない場合" do
    let(:user) { build(:user) }

    it "ログインできない" do
      visit login_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_on 'ログイン'
      expect(page).to have_current_path(login_path)
      expect(page).to have_content("パスワードとemailの組み合わせが正しくありません")
    end
  end
end
