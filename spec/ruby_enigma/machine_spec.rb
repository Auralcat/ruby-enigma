require "spec_helper"
require 'ruby_enigma/machine'

RSpec.describe RubyEnigma::Machine do
  subject(:machine) do
    wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
    wiring_iii = 'bdfhjlcprtxvznyeiwgakmusqo'
    wiring_iv = 'esovpzjayquirhxlnftgkdcmwb'

    described_class.new(
      first_rotor_wiring: wiring_ii,
      second_rotor_wiring: wiring_iii,
      third_rotor_wiring: wiring_iv
    )
  end

  describe '#process' do
    it 'directs the signal through the components correctly' do
      expect(machine.process('a')).to eq('l')
    end

    it 'does not raise errors when receiving text with spaces or punctuation' do
      message = 'My hovercraft is full of eels!'

      expect{ machine.process(message) }.to_not raise_error
    end
  end
end
