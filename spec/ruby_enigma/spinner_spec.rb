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

  it 'spins the first rotor when a letter is typed' do
    spinner.translate('a')

    expect(spinner.first_rotor.turned_once?).to eq(true)
  end

  it 'spins the rotor only once during a single traversion' do
    expect(spinner.first_rotor).to receive(:rotate).twice
    expect(spinner.second_rotor).to_not receive(:rotate)
    expect(spinner.third_rotor).to_not receive(:rotate)

    2.times { spinner.translate('a') }
  end


  it 'spins the second rotor when the first one has completed a full turn' do
    26.times { spinner.translate('a') }

    expect(spinner.first_rotor.completed_full_turn?).to eq(true)
    expect(spinner.second_rotor.turned_once?).to eq(true)
  end

  it 'spins the third rotor when the second one has completed a full turn' do
    677.times { spinner.translate('a') }

    expect(spinner.first_rotor.completed_full_turn?).to eq(true)
    expect(spinner.second_rotor.completed_full_turn?).to eq(true)
    expect(spinner.third_rotor.turned_once?).to eq(true)
  end

  it 'scrambles the letter through all rotors inside' do
    expect(spinner.translate('a')).to eq('s')
  end

  it 'directs the bounced signal correctly through the rotors' do
    expect(spinner.mirror_translate('a')).to eq('c')
  end
end
