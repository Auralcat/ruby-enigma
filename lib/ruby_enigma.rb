require "ruby_enigma/version"
require 'ruby_enigma/machine'

module RubyEnigma
  def self.encrypt(message)
    wiring_ii = 'ajdksiruxblhwtmcqgznpyfvoe'
    wiring_iii = 'bdfhjlcprtxvznyeiwgakmusqo'
    wiring_iv = 'esovpzjayquirhxlnftgkdcmwb'

    machine = RubyEnigma::Machine.new(
      first_rotor_wiring: wiring_ii,
      second_rotor_wiring: wiring_iii,
      third_rotor_wiring: wiring_iv
    )

    machine.process(message)
  end
end
