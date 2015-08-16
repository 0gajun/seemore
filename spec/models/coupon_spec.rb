require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:coupon) { build(:coupon) }

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
end
