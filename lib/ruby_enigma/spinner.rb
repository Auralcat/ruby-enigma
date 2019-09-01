require 'ruby_enigma/rotor'

module RubyEnigma
  # This is where we will couple the Rotors and simulate the clockwork behavior.
  class Spinner
    attr_reader :first_rotor, :second_rotor, :third_rotor

    def initialize(first_rotor_wiring:, second_rotor_wiring:, third_rotor_wiring:)
      @first_rotor = RubyEnigma::Rotor.new(wiring_string: first_rotor_wiring)
      @second_rotor = RubyEnigma::Rotor.new(wiring_string: second_rotor_wiring)
      @third_rotor = RubyEnigma::Rotor.new(wiring_string: third_rotor_wiring)
    end

    def translate(letter)
      @first_rotor.translate(letter)
      @first_rotor.rotate
    end
  end
end
