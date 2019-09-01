require "spec_helper"
require 'ruby_enigma/rotor'

RSpec.describe RubyEnigma::Rotor do
  subject(:rotor) do
    described_class.new(
      wiring_string: 'ajdksiruxblhwtmcqgznpyfvoe'
    )
  end

  describe '#translate' do
    it 'changes the hash table after typing a letter' do
      first_letter = rotor.translate('a')

      rotor.turn!

      expect(rotor.translate('a')).to_not eq(first_letter)
    end
  end

  describe '#completed_full_turn?' do
    it 'returns true when the rotor has completed a full turn' do
      26.times { rotor.turn! }

      expect(rotor.completed_full_turn?).to eq(true)
    end
  end

  describe '#turned_once?' do
    it 'returns true when the rotor has changed positions once' do
      rotor.turn!

      expect(rotor.turned_once?).to eq(true)

      rotor.turn!
      expect(rotor.turned_once?).to eq(false)
    end
  end

  describe '#rotate' do
    it 'changes the internal table by one step' do
      rotor.turn!

      expect(rotor.completed_full_turn?).to eq(false)
    end
  end
end
