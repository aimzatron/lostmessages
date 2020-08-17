require 'rails_helper'

RSpec.describe "ProjectMessages", type: :request do

  describe 'POST /project_messages' do
    let(:project) { create(:project) }

    context 'when the request is valid' do
      before { post '/project_messages', params: { key: 7, project_id: project.id, message_id: 798 } }

      it 'creates a project_message' do
        expect(JSON.parse(response.body)['key']).to eq(7)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/project_messages', params: { key: '', project_id: project.id, message_id: 6 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Key can't be blank/)
      end
    end
  end
end
