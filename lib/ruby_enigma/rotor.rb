require 'ruby_enigma/scramblable'

module RubyEnigma
  # This component has interchangeable wirings, and rotates after certain
  # conditions, depending on the position in the machine.
  class Rotor
    include RubyEnigma::Scramblable
    def initialize(wiring_string:)
      @table = ('a'..'z').zip(wiring_string.split('')).to_h
    end

    def rotate
      @table = ('a'..'z').zip(target_table.rotate).to_h
    end

    def target_table
      @table.values
    end
  end
end
