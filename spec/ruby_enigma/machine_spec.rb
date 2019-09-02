require 'spec_helper'
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

    it 'does not return the same encrypted message for a given input' do
      message = 'Nothing to report in the front.'

      first_encrypted_message = machine.process(message)
      second_encrypted_message = machine.process(message)

      expect(first_encrypted_message).to_not eq(second_encrypted_message)
    end

    context 'when the machines have the same initialization settings' do
      subject(:maschine_eins) do
        wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
        wiring_iii = 'bdfhjlcprtxvznyeiwgakmusqo'
        wiring_iv = 'esovpzjayquirhxlnftgkdcmwb'

        described_class.new(
          first_rotor_wiring: wiring_ii,
          second_rotor_wiring: wiring_iii,
          third_rotor_wiring: wiring_iv
        )
      end

      subject(:maschine_zwei) do
        wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
        wiring_iii = 'bdfhjlcprtxvznyeiwgakmusqo'
        wiring_iv = 'esovpzjayquirhxlnftgkdcmwb'

        described_class.new(
          first_rotor_wiring: wiring_ii,
          second_rotor_wiring: wiring_iii,
          third_rotor_wiring: wiring_iv
        )
      end

      it 'returns the original message when entering the encrypted version' do
        message = 'hello'

        encrypted_message = maschine_eins.process(message)
        expect(maschine_zwei.process(encrypted_message)).to eq(message)
      end

      it 'returns the same message for a given input' do
        message = 'hallo'

        expect(maschine_eins.process(message)).to eq(maschine_zwei.process(message))
      end
    end
  end
end
