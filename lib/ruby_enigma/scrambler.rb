module RubyEnigma
  # A Scrambler is basically a hash table. It's there to map a letter to
  # another. Both the Plugboard and the Rotors are classified as Scramblers,
  # since the difference between them is that the initial Rotor has its
  # translation table shifted with each letter typed.
  class Scrambler
    def initialize(wiring_string:)
      @table = ('a'..'z').zip(wiring_string.split('')).to_h
    end

    def translate(letter)
      @table[letter]
    end

    def rotate
      previous_values = @table.values
      @table = ('a'..'z').zip(previous_values.rotate).to_h
    end
  end
end
