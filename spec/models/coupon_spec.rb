require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:restaurant) { create(:restaurant) }
  let(:coupon) { build(:coupon) }
  before { coupon.restaurant_id = restaurant.id }

  describe "クーポンの作成は" do
    subject { coupon.save }
    
    context "正常値の場合" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
    context "titleが空の場合" do
      before { coupon.title = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "restaurant_idがnilの場合" do
      before { coupon.restaurant_id = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "contentが空の場合" do
      before { coupon.content = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "expiration_dateがnilの場合" do
      before { coupon.expiration_date = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "conditionが空の場合でも" do
      before { coupon.condition = "" }
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
    context "remainがnilの場合でも" do
      before { coupon.remain = nil }
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
  end
  describe "外部キー制約について" do
    let(:restaurant2) { create(:restaurant2) }
    let(:coupon2) { build(:coupon) }
    before { coupon2.restaurant_id = restaurant2.id }

    context "restraunt_idが存在しないものの場合" do
      before { coupon.restaurant_id = 99999 }
      it "クーポン作成は失敗する" do
        expect{ coupon.save }.to raise_error ActiveRecord::InvalidForeignKey
      end
    end
    context "店舗が削除された場合" do
      before do
        coupon2.save
        restaurant.destroy!
      end

      it "restaurant_idが一致するクーポンも削除されること" do
        expect{ Coupon.find(coupon.id) }.to raise_error ActiveRecord::RecordNotFound
      end
      it "restaurant_idが一致しないクーポンは削除されないこと" do
        expect(Coupon.find(coupon2.id)).to eq(coupon2)
      end
    end
  end
  describe "関連メソッド" do
    it { is_expected.to respond_to(:restaurant) }
  end
end
