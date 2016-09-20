require 'spec_helper'

describe Appboy::REST::Unsubscribes do
  let(:http) { double(:http) }

  before { subject.http = http }

  subject { described_class.new(:app_group_id, start_date: :start_date, end_date: :end_date, offset: :offset) }

  it 'makes an http call to the email status endpoint' do
    expect(http).to receive(:get).with '/email/unsubscribes', {
                                                           app_group_id: :app_group_id,
                                                           start_date: :start_date,
                                                           end_date: :end_date,
                                                           offset: :offset
                                                       }

    subject.perform
  end
end