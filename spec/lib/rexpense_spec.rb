require "spec_helper"

describe Rexpense do
  it "has a version number" do
    expect(Rexpense::VERSION).to_not be_nil
  end

  describe "configuration" do
    it "should be done via block initialization" do
      Rexpense.configure do |c|
        c.user_agent = "My App v1.0"
        c.api_mode = "sandbox"
        c.version = 'v1'
      end

      expect(Rexpense.configuration.user_agent).to eq("My App v1.0")
      expect(Rexpense.configuration.api_mode).to eq("sandbox")
      expect(Rexpense.configuration.version).to eq("v1")
    end

    it "uses a singleton object for the configuration values" do
      config1 = Rexpense.configuration
      config2 = Rexpense.configuration
      expect(config1).to eq(config2)
    end
  end

  describe ".client" do
    it "instantiates a new client" do
      expect(Rexpense::Client).to receive(:new).with("abc").and_call_original
      Rexpense.client("abc")
    end
  end
end
