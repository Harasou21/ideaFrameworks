require 'rails_helper'

RSpec.describe Mandalart, type: :model do
  before do
    @mandalart = FactoryBot.build(:mandalart)
  end

  describe "投稿" do
    context "投稿できる場合" do
      it "テキストがあれば投稿できる" do
        expect(@mandalart).to be_valid
      end
    end

    context "投稿できない場合" do
      it "テキストの文字数が300文字以上" do
        @mandalart.text = "a" * 301
        @mandalart.valid?
        expect(@mandalart.errors.full_messages).to include("Text is too long (maximum is 300 characters)")
      end
    end
  end
end
