require 'spec_helper'
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

  it 'spins the rotor only once during a single traversion' do
    expect(spinner.first_rotor).to receive(:turn!).once
    expect(spinner.second_rotor).to_not receive(:turn!)
    expect(spinner.third_rotor).to_not receive(:turn!)

    spinner.translate('a')
  end


  it 'spins the second rotor when the first one has completed a full turn' do
    expect(spinner.second_rotor).to receive(:turn!).once
    expect(spinner.third_rotor).to_not receive(:turn!)

    26.times { spinner.translate('a') }

    expect(spinner.first_rotor.completed_full_turn?).to eq(true)
  end

  it 'spins the third rotor when the second one has completed a full turn' do
    expect(spinner.third_rotor).to receive(:turn!).once

    676.times { spinner.translate('a') }

    expect(spinner.second_rotor.completed_full_turn?).to eq(true)
    expect(spinner.first_rotor.completed_full_turn?).to eq(true)
  end

  it 'scrambles the letter through all rotors inside' do
    expect(spinner.translate('a')).to eq('s')
  end

  it 'directs the bounced signal correctly through the rotors' do
    expect(spinner.mirror_translate('f')).to eq('a')
  end
end
