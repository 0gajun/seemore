require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu) { build(:menu) }

  describe "メニュー作成は" do
    context "正常値の場合" do
      it "成功すること" do
        expect(menu.save).to eq(true)
      end
    end
    context "restaurant_idがnilの場合は" do
      before { menu.restaurant_id = nil }
      it "失敗すること" do
        expect(menu.save).to eq(false)
      end
    end
    context "nameが空の場合は" do
      before { menu.name = "" }
      it "失敗すること" do
        expect(menu.save).to eq(false)
      end
    end
    context "priceがnilでも" do
      before { menu.price = nil }
      it "成功すること" do
        expect(menu.save).to eq(true)
      end
    end
    context "priceが負の数の場合" do
      before { menu.price = -100 }
      it "失敗すること" do
        expect(menu.save).to eq(false)
      end
    end
  end
end
