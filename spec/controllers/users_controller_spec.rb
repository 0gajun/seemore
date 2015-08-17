require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    let(:params) { {:user => attributes_for(:user)} }
    subject { post :create, params }
    context "正常値の場合" do
      it "ユーザの数が1増えること" do
        expect{ subject }.to change{ User.count }.by(1)
      end
      it "200が返ること" do
        subject
        expect(response.status).to eq 200
      end
    end
    context "異常値の場合" do
      before { params[:user].delete(:username) }
      it "ユーザの数が変化しないこと" do
        expect{ subject }.to change{ User.count }.by(0)
      end
      it "400:BadRequestが返ること" do
        subject
        expect(response.status).to eq 400
      end
    end

  end
end
