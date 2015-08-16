require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザ作成は" do
    let(:user) { build(:user) }
    let(:user2) { build(:user2) }
    subject { user.save }
    context "正しいパラメータの際" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
    context "usernameが空の場合" do
      before { user.username = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "emailが空の場合" do
      before { user.email = "" }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "sexが空の場合" do
      before { user.sex = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "usernameが重複するユーザが既に存在する場合" do
      before do
        user2.username = user.username
        user2.save
      end
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "emailが重複するユーザが既に存在する場合" do
      before do
        user2.email = user.email
        user2.save
      end
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "sexの値が[0,1,2]の場合" do
      [0, 1, 2].each do |value|
        before { user.sex = value }
        it "成功すること" do
          expect(subject).to eq(true)
        end
      end
    end
    context "sexの値が[0,1,2]以外の場合" do
      [-1, 3, 4].each do |value|
        before { user.sex = value }
        it "失敗すること" do
          expect(subject).to eq(false)
        end
      end
    end
  end

  describe "関連メソッド" do
    it { is_expected.to respond_to(:followers) }
    it { is_expected.to respond_to(:followed_users) }
    it { is_expected.to respond_to(:check_ins) }
    it { is_expected.to respond_to(:congestion_reports) }
  end

  describe ".follow!" do
    let(:user) { create(:user) }
    let(:user2) { create(:user2) }
    subject { user }
    before { user.follow!(user2) }
    it { is_expected.to be_following(user2) }
    it { expect(subject.followed_users).to include(user2) }

    describe "and .unfollow!" do
      before { user.unfollow!(user2) }
      it { is_expected.not_to be_following(user2) }
      it { expect(subject.followed_users).not_to include(user2) }
    end

    describe "followed user" do
      subject { user2 }
      it { expect(subject.followers).to include(user) }
    end
  end

  describe ".check_in" do
    let(:user) { create(:user) }
    let(:restaurant) { create(:restaurant) }
    let(:check_in) { build(:check_in) }
    subject { user.check_in!(restaurant, check_in.menu_id, check_in.comment) }
    it { expect{ subject }.to change{ user.check_ins.count }.by(1) }
  end
end
