require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'POST #create' do
    subject(:invoke_request) { post :create, params: { event: event_params } }

    context 'given a valid event' do
      let(:event_params) { { event_type: 'button_press', button_mac_address: 'SOME MAC ADDRESS' } }

      specify do
        invoke_request
        expect(response).to have_http_status(201)
      end
    end

    context 'given an invalid event' do
      let(:event_params) { { event_type: '???', button_mac_address: '' } }

      specify do
        invoke_request
        expect(response).to have_http_status(422)
      end

      it 'returns the errors in the response' do
        invoke_request
        expect(JSON.parse(response.body)).to include('errors')
      end
    end
  end
end
