require "spec_helper"
require 'ruby_enigma/reflector'

RSpec.describe RubyEnigma::Reflector do
  subject(:reflector) { described_class.new }

  it 'returns the same letter pair for a given wiring' do
    input_letter = 'a'
    bounced_letter = reflector.translate(input_letter)

    expect(reflector.translate(bounced_letter)).to eq(input_letter)
  end
end
