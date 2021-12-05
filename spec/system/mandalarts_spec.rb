require 'rails_helper'

RSpec.describe "Mandalarts", type: :system do

    
    #@mandalart = FactoryBot.create(:mandalart)
    
  context "マンダラートが書ける時" do
    it "マンダラート記入の流れ" do

      get root_path

      save_and_open_page
      expect(page.all('td').count).to eq $mandalart_blocks_num
      # マンダラートが$mandalart_blocks_num分ある。
      expect(page).to have_content('記入')
      # マンダラートの記入ボタンがある
      click_on "記入",match: :first
      
      expect(current_path).to eq(edit_mandalart_path(mandalart))
      # 記入ボタンをクリックしたら、mandalarats/edit.html.erbに遷移
      fill_in 'text', with: "aaaa"
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # フォームにテキストを入力して、inputタグをクリックしたら
      # root_pathに遷移
      expect(page).to have_content('aaaa')
      # 先程入力したaaaaがある
    end


  end

end
