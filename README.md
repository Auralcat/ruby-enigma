# RubyEnigma

Reproduce the workings of the [Enigma machine](https://en.wikipedia.org/wiki/Enigma_machine) using TDD.
More specifically, the goal is to replicate the workings of the Enigma M3, with
rotors II, III and IV, with wiring I as the plugboard scrambler.
You can get more information about the wirings [here.](https://www.cryptomuseum.com/crypto/enigma/wiring.htm#10)

This is still a work in progress.

## Specifications
- The sender types each letter of the message into a standard keyboard
- The signal passes through a plugboard which switches letters around
- There are more rotors that change the letters in the message
- The reflector bounces the signal back through the circuit, scrambling the
  letters again in reverse

There's more information [here.](http://enigma.louisedade.co.uk/howitworks.html)

## Next steps
- Bundle the components together
- Implemented feature tests
- Include a command line interface
