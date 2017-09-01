RSpec.configure do |config|
  # pass `vcr: true` to an example to run it using VCR
  config.around(:each, vcr: true) do |example|
    name = example.metadata[:full_description].gsub(/\W+/, "_").split("_", 2).join("/").gsub('::', '_')[0, 94]
    VCR.use_cassette(name, record: :once) { example.call }
  end
end
