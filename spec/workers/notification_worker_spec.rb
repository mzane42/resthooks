require 'spec_helper'
require 'sidekiq/testing'

describe NotificationWorker do
  before do
    allow(NotificationWorker).to receive(:post)
    described_class.clear
  end

  it "enqueues notification job" do
    expect { described_class.perform_async(1, :foo) }.to change(described_class.jobs, :size).by(1)
  end

  describe "#perform" do
    let(:worker) { NotificationWorker.new }
    let(:url) { "http://example.com" }
    let(:payload) { %{
        {
          "junk": "something"
        }
      } }
    let(:headers) { { 'Accept' => 'application/json',
                 'Content-type' => 'application/json' } }

    it "takes a hash" do
      expect {
        worker.perform({})
        }.to_not raise_error
    end

    it "sets the url" do
      worker.perform(url: url)
      expect(worker.url).to eq(url)
    end

    it "sets the payload" do
      worker.perform(payload: payload)
      expect(worker.payload).to eq(payload)
    end

    it "posts the payload to the url" do
      expect(NotificationWorker).to receive(:post).with(url, body: payload, headers: headers)

      worker.perform(payload: payload, url: url)
    end

    it "rescues exceptions during the POST" do
      allow(NotificationWorker).to receive(:post).and_raise "chaos!!"

      expect {
        worker.perform({})
      }.to_not raise_error
    end
  end
end
