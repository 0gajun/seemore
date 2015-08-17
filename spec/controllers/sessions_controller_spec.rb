require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST #login" do
    let(:password) { "hogehoge" }
    let(:valid_user) { create(:user, :password => password) }
    let(:valid_params) do 
      {
        :user => { :username => valid_user.username, :password => password }
      }
    end

    context "正規ユーザの時" do
      before { post :create, valid_params }
      it "ログインできること" do
        expect(response.status).to eq 200
        expect(response.body).to include("user")
        expect(response.body).not_to include("encrypted_password")
      end
    end
    context "パスワードが誤りの場合" do
      before do
        valid_params[:user][:password] = "invalid"
        post :create, valid_params
      end
      it "ログイン出来ないこと(401:unauthrized)" do
        expect(response.status).to eq 401
      end
    end
  end
end
