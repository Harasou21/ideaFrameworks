require 'rails_helper'

RSpec.describe "Mandalarts", type: :request do
  describe "GET /mandalarts" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it "マスがちゃんと９つあるか" do
      # spec/system/mandalart_spec.rb
      # でカバーすることにします。
    end

    it "配列が空だったら、$mandalart_blocks_num分マス目が作られるか" do
      # spec/system/mandalart_spec.rb
      # でカバーできてる気がする
    end
  end

  describe "GET #edit" do
    it "editアクションにリクエストすると、正常にレスポンスが返ってくる" do
      @mandalart = FactoryBot.create(:mandalart)
      # before doで上記のコードを定義すると
      # FactoryBot上で、mandalartは一個しか作られてないので、
      # mandalarts/index.html.erbのeachでエラー起こる
      get edit_mandalart_path(@mandalart)
      expect(response).to have_http_status(:ok)
    end

    it "editアクションにリクエストすると、フォームと投稿ボタンがある" do
      @mandalart = FactoryBot.create(:mandalart)
      get edit_mandalart_path(@mandalart)
      expect(response.body).to include('<textarea class="form" name="mandalart[text]" id="mandalart_text">')
      expect(response.body).to include('<input type="submit" name="commit"')
      # 上２つのテストコードは妥当性があるのかどうか
    end
  end
end
