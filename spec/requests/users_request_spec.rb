require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST#create" do
    context 'when the user is registered' do
      let(:user_params) { attributes_for(:user, name: "John doe",
        email: "johndoe@gmail.com", password: "123123123",
        password_confirmation: "123123123") }

      before do
        post '/users', params: { user: user_params }
      end

      it 'must return status 201 status code' do
        expect(response).to have_http_status(:created)
      end

      it 'must return user attributes' do
        expect(json_body).to include(:name, :email, :password,
                                     :password_confirmation)
      end
    end

    context 'when the user send wrong attributes' do
      let(:invalid_params) { attributes_for(:user, name: nil,
        email: nil, password: "123123123",
        password_confirmation: "123123123") }

      before do
        post '/users', params: { user: invalid_params }
      end

      it 'must return status 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return errors message' do
        expect(json_body).to have_key(:errors)
      end
    end
  end
end
