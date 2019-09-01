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
      previous_values = @table.values
      @table = ('a'..'z').zip(previous_values.rotate).to_h
    end
  end
end
