require 'spec_helper'

describe 'unsubscribes' do
  let(:start_date) { "2016-09-19" }
  let(:end_date) { "2016-09-20" }
  let(:offset) { 0 }

  subject do
    api.unsubscribes(start_date: start_date, end_date: end_date, offset: offset)
  end

  context 'existing email', vcr: true do
    it 'responds with created' do
      expect(subject.status).to be 200
    end

    it 'responds with success message' do
      expect(subject.body).to eq(
                                  {"emails"=>
                                       [{"email"=>"test@test.com", "unsubscribed_at"=>"2016-09-19 18:05:52 +0000"},
                                        {"email"=>"test@test.com", "unsubscribed_at"=>"2016-09-19 18:05:49 +0000"},
                                        {"email"=>"test@test.com", "unsubscribed_at"=>"2016-09-19 17:52:08 +0000"}],
                                   "message"=>"success"}
                              )
    end
  end
end