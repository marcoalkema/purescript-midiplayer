module MidiPlayer where

import Prelude
import Control.Monad.Eff

type DataURL = String

foreign import data MIDI :: !

foreign import loadPlugin :: forall e. PluginConfigRec -> (Unit -> Eff (midi :: MIDI | e) Unit) -> Eff (midi :: MIDI | e) Unit                    

foreign import setVolume :: forall e. Eff (midi :: MIDI | e) Unit

foreign import loadFile :: forall e. DataURL -> Eff (midi :: MIDI | e) Unit

foreign import play :: forall e. Eff (midi :: MIDI | e) Unit

foreign import stop :: forall e. Eff (midi :: MIDI | e) Unit

foreign import pause :: forall e. Eff (midi :: MIDI | e) Unit

foreign import resume :: forall e. Eff (midi :: MIDI | e) Unit

foreign import endtime :: forall e. Eff (midi :: MIDI | e) Unit

foreign import currentTime :: forall e. Eff (midi :: MIDI | e) Unit

foreign import playing :: forall e. Eff (midi :: MIDI | e) Unit

type InstrumentName = String

type PluginConfigRec =
  { soundfontUrl :: String
  , instrument   :: InstrumentName
  }
