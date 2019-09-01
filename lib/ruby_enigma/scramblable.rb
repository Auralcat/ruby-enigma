module RubyEnigma
  # This module implements the #translate method, since all components in the
  # machine change the signal in some way. The #mirror_translate represents the
  # interpretation of the signal on its way back.
  module Scramblable
    def translate(letter)
      @table[letter]
    end

    def mirror_translate(letter)
      @mirror_table[letter]
    end
  end
end
