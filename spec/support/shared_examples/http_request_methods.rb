shared_examples "available http request methods" do
  it "instantiates a new Request object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Rexpense::Request).to receive(:new).with(
        body: params,
        method: http_method,
        token: "8cd049b4afca9213fb2455528394ab2fb0bc34f5c905f33c",
        url: "https://sandbox.rexpense.com/api/v1#{url}",
        user_agent: "Rexpense Ruby Client v#{Rexpense::VERSION}"
      ).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "runs the request" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Rexpense::Request).to receive(:run).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "instantiates a new Response object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect(Rexpense::Response).to receive(:new).and_call_original
      subject.send(http_method, url, body: params)
    end
  end

  it "resolves the response of the request a new Response object" do
    VCR.use_cassette("client/#{http_method}/request") do
      expect_any_instance_of(Rexpense::Response).to receive(:resolve!).and_call_original
      subject.send(http_method, url, body: params)
    end
  end
end
