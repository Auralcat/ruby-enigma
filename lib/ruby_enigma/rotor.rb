require 'ruby_enigma/scramblable'

module RubyEnigma
  # This component has interchangeable wirings, and rotates after certain
  # conditions, depending on the position in the machine.
  class Rotor
    include RubyEnigma::Scramblable

    def initialize(wiring_string:)
      @table = alphabet.zip(wiring_string.split('')).to_h
      @mirror_table = (wiring_string.split('')).zip(alphabet).to_h
      @base_wiring_table = wiring_string.split('')
    end

    def rotate
      @table = alphabet.zip(target_table.rotate).to_h
      @mirror_table = @base_wiring_table.zip(target_mirror_table.rotate).to_h
    end

    def completed_full_turn?
      target_table == @base_wiring_table
    end

    def rotated_once?
      target_table == @base_wiring_table.rotate
    end

    private

    def target_table
      @table.values
    end

    def target_mirror_table
      @mirror_table.values
    end

    def alphabet
      ('a'..'z')
    end
  end
end
