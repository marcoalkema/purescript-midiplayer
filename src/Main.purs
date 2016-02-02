module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import MidiPlayer as Midi

main :: forall e. Eff (midi :: Midi.MIDI, console :: CONSOLE | e) Unit
main = do
  Midi.loadFile arabesque
  Midi.loadPlugin { soundfontUrl: "bower_components/midi/examples/soundfont/"
                  , instrument:   "acoustic_grand_piano"
                  }
                  (const play)

play :: forall e. Eff (midi :: Midi.MIDI | e) Unit
play = do
  Midi.play
  
arabesque :: String
arabesque = "midi/arabesqu.mid"
