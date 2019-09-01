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

  describe '#completed_full_turn?' do
    it 'returns true when the rotor has completed a full turn' do
      26.times { rotor.rotate }

      expect(rotor.completed_full_turn?).to eq(true)
    end
  end

  describe '#rotated_once?' do
    it 'returns true when the rotor has changed positions once' do
      rotor.rotate

      expect(rotor.rotated_once?).to eq(true)

      rotor.rotate
      expect(rotor.rotated_once?).to eq(false)
    end
  end
end
