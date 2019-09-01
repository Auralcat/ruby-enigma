RSpec.describe RubyEnigma do
  it "has a version number" do
    expect(RubyEnigma::VERSION).not_to be nil
  end

  it "returns an encrypted message" do
    message = 'Nothing to report in the front.'

    expect(described_class.encrypt(message)).to_not eq(message)
  end

  it 'does not return the same encrypted message for a given input' do
    message = 'Nothing to report in the front.'
    first_encrypted_message = described_class.encrypt(message)
    second_encrypted_message = described_class.encrypt(message)

    expect(first_encrypted_message).to_not eq(second_encrypted_message)
  end

  it 'returns the original message when entering the encrypted version' do
    message = 'hello'

    encrypted_message = described_class.encrypt(message)
    expect(described_class.encrypt(encrypted_message)).to eq(message)
  end
end
