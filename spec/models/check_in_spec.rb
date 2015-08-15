require 'rails_helper'

RSpec.describe CheckIn, type: :model do
  let(:check_in) { build(:check_in) }

  describe "チェックインの作成は" do
    context "正常値の場合" do
      it "成功すること" do
        expect(check_in.save).to eq(true)
      end
    end
    context "user_idがnilの場合" do
      before { check_in.user_id = nil }
      it "失敗すること" do
        expect(check_in.save).to eq(false)
      end
    end
    context "restaurant_idがnilの場合" do
      before { check_in.restaurant_id = nil }
      it "失敗すること" do
        expect(check_in.save).to eq(false)
      end
    end
    context "menu_idがnilの場合でも" do
      before { check_in.menu_id = nil }
      it "成功すること" do
        expect(check_in.save).to eq(true)
      end
    end
    context "commentが空でも" do
      before { check_in.comment = "" }
      it "成功すること" do
        expect(check_in.save).to eq(true)
      end
    end
  end
end
