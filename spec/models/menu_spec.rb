require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:restaurant) { create(:restaurant) }
  let(:menu) { build(:menu) }
  before { menu.restaurant_id = restaurant.id }

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
  describe "外部キー制約について" do
    let(:restaurant2) { create(:restaurant2) }
    let(:menu2) { build(:menu2) }
    before { menu2.restaurant_id = restaurant2.id }

    context "restraunt_idが存在しないものの場合" do
      before { menu.restaurant_id = 99999 }
      it "menu作成は失敗する" do
        expect{ menu.save }.to raise_error ActiveRecord::InvalidForeignKey
      end
    end
    context "店舗が削除された場合" do
      before do
        menu2.save
        restaurant.destroy!
      end

      it "restaurant_idが一致するmenuも削除されること" do
        expect{ Menu.find(menu.id) }.to raise_error ActiveRecord::RecordNotFound
      end
      it "restaurant_idが一致しないmenuは削除されないこと" do
        expect(Menu.find(menu2.id)).to eq(menu2)
      end
    end
  end
end
