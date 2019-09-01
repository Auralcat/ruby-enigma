require "spec_helper"
require 'ruby_enigma/plugboard'

RSpec.describe RubyEnigma::Plugboard do
  subject(:plugboard) { described_class.new }

  it 'maps a letter to a key using wiring I' do
    expect(plugboard.translate('e')).to eq('l')
    expect(plugboard.translate('a')).to eq('e')
    expect(plugboard.translate('j')).to eq('z')
  end
end
