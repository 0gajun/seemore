require 'rails_helper'

RSpec.describe CongestionReport, type: :model do
  let(:congestion) { build(:congestion_report) }
  describe "混雑レポートの作成は" do
    subject { congestion.save }
    context "正常値の場合" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
    context "user_idがnilの場合" do
      before { congestion.user_id = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "restaurant_idがnilの場合" do
      before { congestion.restaurant_id = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "congestionがnilの場合" do
      before { congestion.congestion = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "congestionが正常値(1-4)の場合" do
      it "成功すること" do
        Array(1..4).each do |value|
          congestion.congestion = value
          expect(subject).to eq(true)
        end
      end
    end
    context "congestionが異常値(1-4以外)の場合" do
      it "失敗すること" do
        [-1, 0, 5, 6, 100].each do |value|
          congestion.congestion = value
          expect(subject).to eq(false)
        end
      end
    end
  end

  describe "関連メソッド" do
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:restaurant) }
  end
end
