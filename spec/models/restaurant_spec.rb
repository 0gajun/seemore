require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let (:restaurant) { build(:restaurant) }
  describe "店舗の登録は" do
    subject { restaurant.save }
    context "正しいデータの場合" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end

    context "店舗名が空の場合" do
      before { restaurant.name = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
  end
end
