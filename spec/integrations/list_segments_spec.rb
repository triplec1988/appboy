require 'spec_helper'

describe 'list segments' do
  subject(:list_segments) { api.list_segments }

  context 'with success', :vcr do
    it 'responds with success' do
      expect(list_segments.status).to eq(200)
    end

    it 'responds with a list of segments' do
      expect(segments.count).to be 7

      expect(segments.first['name']).to eq 'test'
    end

    def segments
      list_segments.body['segments']
    end
  end
end
