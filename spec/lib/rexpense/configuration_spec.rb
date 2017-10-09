# encoding: utf-8
require 'spec_helper'

describe Rexpense::Configuration do
  subject { Rexpense::Configuration.new }

  it "uses the production url by default" do
    expect(subject.url).to eq("https://app.rexpense.com")
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq("Rexpense Ruby Client v#{Rexpense::VERSION}")
  end

  it 'allows setting the configuration parameters' do
    subject.url = "http://localhost:3000"
    subject.user_agent = "My specific user agent"

    expect(subject.url).to eq("http://localhost:3000")
    expect(subject.user_agent).to eq("My specific user agent")
  end

  it 'does not respond to #token' do
    expect(subject).to_not respond_to(:token)
  end
end
