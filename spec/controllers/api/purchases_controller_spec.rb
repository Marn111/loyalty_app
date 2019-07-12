require 'rails_helper'

RSpec.describe Api::PurchasesController, type: :controller do

  describe 'GET #create' do

    let(:jhon) { create(:user, name: "Jhon", birthday: "01-01-1989") }
    let(:merry) { create(:user, name: "Merry", birthday: "01-03-1990") }

    context 'expect to fail with invalid attributes' do
      it 'expect to get error message for empty user_id' do
        post :create, format: :json, params: { purchase: FactoryBot.attributes_for(:purchase, user_id: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq "application/json"
        expect(response.body).to include("User can't be blank")
      end

      it 'expect to get error message for empty amount' do
        post :create, format: :json, params: { purchase: FactoryBot.attributes_for(:purchase, amount: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq "application/json"
        expect(response.body).to include("Amount can't be blank")
      end

      it 'expect to get error message for empty currency' do
        post :create, format: :json, params: { purchase: FactoryBot.attributes_for(:purchase, currency: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq "application/json"
        expect(response.body).to include("Currency can't be blank")
      end

      it 'expect to get error message for empty ordered_from' do
        post :create, format: :json, params: { purchase: FactoryBot.attributes_for(:purchase, ordered_from: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq "application/json"
        expect(response.body).to include("Ordered from can't be blank")
      end
    end

    context 'expect to success with valid attributes' do
      it 'expect to return purchase object with status 200' do
        valid_params = FactoryBot.attributes_for(:purchase, user_id: merry.id)
        post :create, format: :json, params: { purchase: valid_params }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq "application/json"
        expect(assigns(:purchase)).to be_persisted
        expect(assigns(:purchase).errors).to be_empty
        expect(assigns(:purchase)).to have_attributes(valid_params)
      end
    end

  end

end
