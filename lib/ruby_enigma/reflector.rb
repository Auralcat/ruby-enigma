require 'ruby_enigma/scramblable'

module RubyEnigma
  # The Reflector is a different component in regards to its hash table, since
  # it returns the same letter pairings. These are also given by a wiring.
  # I'm emulating model M3, which has a single reflector wiring.
  class Reflector
    include Scramblable

    def initialize
      @table = ('a'..'z').zip('yruhqsldpxngokmiebfzcwvjat'.split('')).to_h
    end
  end
end
