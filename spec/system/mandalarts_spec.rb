require 'rails_helper'

RSpec.describe "Mandalarts", type: :system do
    
    before do
      Mandalart.destroy_all
    end
    
    
  context "マンダラートが書ける時" do
    it "マンダラート記入の流れ" do
      visit root_path
      expect(page.all('td').count).to eq $mandalart_blocks_num
      # マンダラートが$mandalart_blocks_num分ある。
      expect(page).to have_content('記入')
      # マンダラートの記入ボタンがある
      click_on "記入",match: :first
      expect(current_path).to eq(edit_mandalart_path(current_path.gsub(/[^\d]/, "").to_i))
      # 記入ボタンをクリックしたら、mandalarats/edit.html.erbに遷移
      # 文字列current_pathから

      fill_in 'mandalart[text]', with: "aaaa"
      find('input[name="commit"]').click
      expect(current_path).to eq("/mandalarts")
      # フォームにテキストを入力して、inputタグをクリックしたら
      # root_pathに遷移
      expect(page).to have_content('aaaa')
      # 先程入力したaaaaがある
    end

    it "何回mandalarts#indexにアクセスしてもマンダラートのマス目は増えない" do

      visit root_path
      expect  do
        visit root_path
        visit root_path
      end.to change { Mandalart.count }.by(0)
    end


  end

end
