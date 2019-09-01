module RubyEnigma
  # This module implements the #translate method, since all components in the
  # machine change the signal in some way.
  module Scramblable
    def translate(letter)
      @table[letter]
    end

    def rotate
      previous_values = @table.values
      @table = ('a'..'z').zip(previous_values.rotate).to_h
    end
  end
end
