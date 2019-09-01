require "spec_helper"
require 'ruby_enigma/plugboard'

RSpec.describe RubyEnigma::Plugboard do
  subject(:plugboard) { described_class.new }

  it 'maps a letter to a key using wiring I' do
    expect(plugboard.translate('e')).to eq('l')
    expect(plugboard.translate('a')).to eq('e')
    expect(plugboard.translate('j')).to eq('z')
  end

  it 'uses a mirror map using wiring I' do
    expect(plugboard.mirror_translate('l')).to eq('e')
    expect(plugboard.mirror_translate('e')).to eq('a')
    expect(plugboard.mirror_translate('z')).to eq('j')
  end
end
