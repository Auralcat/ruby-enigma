RSpec.describe RubyEnigma do
  it 'has a version number' do
    expect(RubyEnigma::VERSION).not_to be nil
  end

  it 'returns an encrypted message' do
    message = 'Nothing to report in the front.'

    expect(described_class.encrypt(message)).to_not eq(message)
  end
end
