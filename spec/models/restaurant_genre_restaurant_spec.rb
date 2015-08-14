require 'rails_helper'

RSpec.describe RestaurantGenreRestaurant, type: :model do
  # TODO: 綺麗にしたい
  let(:genre) { create(:restaurant_genre) }
  let(:restaurant) { create(:restaurant) }
  let(:relation) { build(:restaurant_genre_restaurant) }
  before do
    relation.restaurant_id = restaurant.id
    relation.genre_id = genre.id
    relation.save
  end

  describe "外部制約キーについて" do
    let(:genre2) { create(:restaurant_genre2) }
    let(:restaurant2) { create(:restaurant2) }
    let(:relation2) { build(:restaurant_genre_restaurant) }
    before do
      relation2.restaurant_id = restaurant2.id
      relation2.genre_id = genre2.id
      relation2.save
    end

    context "ジャンルが削除された場合" do
      before { genre.destroy! }
      it "genre_idが一致するものが削除されること" do
        expect{ RestaurantGenreRestaurant.find(relation.id) }.to raise_error ActiveRecord::RecordNotFound
      end
      it "genre_idが一致しないものは削除されないこと" do
        expect(RestaurantGenreRestaurant.find(relation2.id)).to eq(relation2)
      end
    end

    context "店舗が削除された場合" do
      before { restaurant.destroy! }
      it "restaurant_idが一致するものが削除されること" do
        expect{ RestaurantGenreRestaurant.find(relation.id) }.to raise_error ActiveRecord::RecordNotFound
      end
      it "restaurant_idが一致しないものは削除されないこと" do
        expect(RestaurantGenreRestaurant.find(relation2.id)).to eq(relation2)
      end
    end
  end
end
