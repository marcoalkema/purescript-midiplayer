module MidiJS where

import Prelude
import Control.Monad.Eff
import Data.Function.Eff as EffFn
import MidiPlayer as Midi

foreign import data FILE :: !

main :: forall e. Eff (midi :: Midi.MIDI, file :: FILE | e) Unit
main = do
  Midi.loadFile "midi/1bar8s.mid"
  Midi.loadPlugin { soundfontUrl: "bower_components/midi/examples/soundfont/"
                  , instrument:   "acoustic_grand_piano"
                  }
                  (const play)

play :: forall e. Eff (midi :: Midi.MIDI | e) Unit
play = do
  playLoop 12000.0
  
playLoop :: forall e. Number -> Eff (midi :: Midi.MIDI | e) Unit
playLoop startTime = do
  Midi.stop
  Midi.setCurrentTime startTime
  Midi.play
