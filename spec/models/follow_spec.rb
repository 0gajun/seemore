require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user2) }
  let(:follow) { build(:follow) }
  before do
    follow.followee_id = user1.id
    follow.follower_id = user2.id
  end

  describe "フォローの作成は" do
    subject { follow.save }
    context "正常値の場合" do
      it "成功すること" do
        expect(subject).to eq(true)
      end
    end
    context "followerがnilの場合" do
      before { follow.follower_id = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
    context "followeeがnilの場合" do
      before { follow.followee_id = nil }
      it "失敗すること" do
        expect(subject).to eq(false)
      end
    end
  end

  describe "外部キー制約において" do
    let(:user3) { create(:user3) }
    let(:user4) { create(:user4) }
    let(:follow2) { build(:follow) }
    before do
      follow2.followee_id = user3.id
      follow2.follower_id = user4.id
      follow2.save
    end
    
    context "followeeが存在しないuserの場合" do
      before { follow.followee_id = 99999 } 
      it "作成に失敗すること" do
        expect{ follow.save }.to raise_error ActiveRecord::InvalidForeignKey
      end
    end
    context "followerが存在しないuserの場合" do
      before { follow.follower_id = 99999 } 
      it "作成に失敗すること" do
        expect{ follow.save }.to raise_error ActiveRecord::InvalidForeignKey
      end
    end
    describe "ユーザが削除されると" do
      context "followeeに該当ユーザがあれば" do
        before { user1.destroy! }
        it "followが削除されること" do
          expect { Follow.find(follow.id) }.to raise_error ActiveRecord:: RecordNotFound
        end
      end
      context "followerに該当ユーザがあれば" do
        before { user2.destroy! }
        it "followが削除されること" do
          expect { Follow.find(follow.id) }.to raise_error ActiveRecord:: RecordNotFound
        end
      end
      context "followee, followerに該当ユーザがいなければ" do
        before { user1.destroy!; user2.destroy! }
        it "followが削除されないこと" do
          expect(Follow.find(follow2.id)).to eq(follow2)
        end
      end
    end
  end

  describe "関連付けのテスト" do
    it { is_expected.to respond_to(:followee) }
    it { is_expected.to respond_to(:follower) }
  end
end
