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
      out = traverse_rotors(letter)

      move_rotors!
      out
    end

    def mirror_translate(letter)
      mirror_traverse_rotors(letter)
    end

    private

    def move_rotors!
      @first_rotor.turn!
      @second_rotor.turn! if @first_rotor.completed_full_turn?
      @third_rotor.turn! if @second_rotor.completed_full_turn?
    end

    def traverse_rotors(letter)
      first_pass = @first_rotor.translate(letter)
      second_pass = @second_rotor.translate(first_pass)

      @third_rotor.translate(second_pass)
    end

    def mirror_traverse_rotors(letter)
      first_pass = @third_rotor.mirror_translate(letter)
      second_pass = @second_rotor.mirror_translate(first_pass)

      @first_rotor.mirror_translate(second_pass)
    end
  end
end
