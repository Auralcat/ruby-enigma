require "spec_helper"
require 'ruby_enigma/rotor'

RSpec.describe RubyEnigma::Rotor do
  subject(:rotor) do
    described_class.new(
      wiring_string: 'ajdksiruxblhwtmcqgznpyfvoe'
    )
  end

  it 'changes the hash table after typing a letter' do
    first_letter = rotor.translate('a')

    rotor.rotate

    expect(rotor.translate('a')).to_not eq(first_letter)
  end
end
