require "spec_helper"
require 'ruby_enigma/spinner'

RSpec.describe RubyEnigma::Spinner do

  subject(:spinner) do
  # I'm using wirings II, III and IV
  wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
  wiring_iii = 'bdfhjlcprtxvznyeiwgakmusqo'
  wiring_iv = 'esovpzjayquirhxlnftgkdcmwb'

    described_class.new(
      first_rotor_wiring: wiring_ii,
      second_rotor_wiring: wiring_iii,
      third_rotor_wiring: wiring_iv
    )
  end

  it 'spins the first rotor when a letter is typed' do
    wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
    spinner.translate('a')

    expect(spinner.first_rotor.target_table).to eq(wiring_ii.split('').rotate)
  end

  xit 'spins the second rotor when the first one has completed a full turn' do
  end

  xit 'spins the third rotor when the second one has completed a full turn' do
  end
end
