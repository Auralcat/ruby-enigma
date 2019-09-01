require "spec_helper"
require "ruby_enigma/scrambler"

RSpec.describe RubyEnigma::Scrambler do
  subject(:scrambler) do
    described_class.new(
      wiring_string: 'zphnmswciytqedoblrfkuvgxja'
    )
  end

  it 'maps a letter to another' do
    expect(scrambler.translate('a')).to_not eq(scrambler.translate('b'))
  end

  it 'rotates the inner hash table' do
    first_result = scrambler.translate('a')

    scrambler.rotate

    expect(first_result).to_not eq(scrambler.translate('a'))
  end
end
