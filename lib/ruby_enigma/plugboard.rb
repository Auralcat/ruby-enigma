require 'ruby_enigma/scramblable'

module RubyEnigma
  # This component is near the keyboard and the bounced signal and it's static.
  # This emulation uses wiring I from the M3 model as the plugboard.
  class Plugboard
    include RubyEnigma::Scramblable

    def initialize
      @table = ('a'..'z').zip('ekmflgdqvzntowyhxuspaibrcj'.split('')).to_h
      @mirror_table = 'ekmflgdqvzntowyhxuspaibrcj'.split('').zip(('a'..'z')).to_h
    end
  end
end
