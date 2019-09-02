require 'ruby_enigma/spinner'
require 'ruby_enigma/plugboard'
require 'ruby_enigma/reflector'

module RubyEnigma
  # The machine implements the whole set of components wired together.
  class Machine
    def initialize(first_rotor_wiring:, second_rotor_wiring:, third_rotor_wiring:)
      @plugboard = RubyEnigma::Plugboard.new
      @spinner = RubyEnigma::Spinner.new(
        first_rotor_wiring: first_rotor_wiring,
        second_rotor_wiring: second_rotor_wiring,
        third_rotor_wiring: third_rotor_wiring
      )
      @reflector = RubyEnigma::Reflector.new
    end

    def process(text)
      out = ''

      text.gsub(/[ !.?|<>]/, '').downcase.split('').each do |letter|
        out += traverse(letter)
      end

      out
    end

    private

    def traverse(letter)
      first_pass = @plugboard.translate(letter)
      second_pass = @spinner.translate(first_pass)

      bounced_pass = @reflector.translate(second_pass)
      second_pass = @spinner.mirror_translate(bounced_pass)
      out = @plugboard.mirror_translate(second_pass)

      out
    end
  end
end
