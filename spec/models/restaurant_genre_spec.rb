require 'rails_helper'

RSpec.describe RestaurantGenre, type: :model do
  describe "店舗のジャンル作成は" do
    let(:genre) { build(:restaurant_genre) }
    subject { genre.save }
    context "正しいデータの時" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end

    context "カテゴリ名が空の時" do
      before { genre.name = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end

    context "カテゴリ名が重複するとき" do
      before { create(:restaurant_genre) }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
  end
end
