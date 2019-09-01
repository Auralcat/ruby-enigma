require "ruby_enigma/version"
require 'securerandom'

module RubyEnigma
  PLUGBOARD = ('a'..'z').zip('zphnmswciytqedoblrfkuvgxja'.split('')).to_h

  def self.encrypt(message)
    SecureRandom.uuid
  end
end
