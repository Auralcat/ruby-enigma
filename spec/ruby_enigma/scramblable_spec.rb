require "spec_helper"
require "ruby_enigma/scramblable"

class DummyComponent
  include RubyEnigma::Scramblable

  def initialize
    @table = ('a'..'z').zip('yruhqsldpxngokmiebfzcwvjat'.split('')).to_h
  end
end

RSpec.describe RubyEnigma::Scramblable do
  subject(:component) { DummyComponent.new }

  it 'maps a letter to another' do
    expect(component.translate('a')).to_not eq(component.translate('b'))
  end
end
