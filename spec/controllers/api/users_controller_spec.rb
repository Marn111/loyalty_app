require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe 'GET #show' do

    let!(:rose) { create(:user, name: 'Rose', birthday: "01-06-1995", origin_country: "Singapore") }

    context 'point increase by 10 Dollars x 1 point' do
      before { get :show, params: { id: rose.id } }

      it 'expect to return user object with 0.0 points' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq "application/json"
        expect(assigns(:user).id).to be(rose.id)
        expect(assigns(:user).points).to be(rose.points)
      end

      let(:order_1) { create(:purchase, user_id: rose.id, ordered_from: rose.origin_country) }
      it 'expect to return user object with increased points' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq "application/json"
        expect(assigns(:user).id).to be(rose.id)
        expected_points = rose.points + (order_1.amount/Purchase::STANDARD_POINT)
        expect(assigns(:user).points).to be(rose.points)
      end

      let(:order_2) { create(:purchase, user_id: rose.id, ordered_from: "Thailand") }
      it 'expect to return user object with double increased points' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq "application/json"
        expect(assigns(:user).id).to be(rose.id)
        expected_points = rose.points + 2 * (order_1.amount/Purchase::STANDARD_POINT)
        expect(assigns(:user).points).to be(rose.points)
      end




    end

  end

end
