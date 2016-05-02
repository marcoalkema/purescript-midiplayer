module MidiPlayer where

import Prelude
import Control.Monad.Eff
import MidiJsTypes
import Data.Foreign

type DataURL = String

foreign import data MIDI :: !
foreign import data MIDI2 :: !

foreign import loadPlugin :: forall e. PluginConfigRec -> (Unit -> Eff (midi :: MIDI | e) Unit) -> Eff (midi :: MIDI | e) Unit                    

foreign import setVolume :: forall e. Eff (midi :: MIDI | e) Unit

foreign import loadFile :: forall e. String -> Eff (midi :: MIDI | e) Unit

foreign import play :: forall e. Eff (midi :: MIDI | e) Unit

foreign import stop :: forall e. Eff (midi :: MIDI | e) Unit

foreign import pause :: forall e. Eff (midi :: MIDI | e) Unit

foreign import resume :: forall e. Eff (midi :: MIDI | e) Unit

foreign import currentTime :: forall e. Eff (midi :: MIDI | e) Unit

foreign import endTime :: forall e. Eff (midi :: MIDI | e) Unit

foreign import setCurrentTime :: Number -> forall e. Eff (midi :: MIDI | e) Unit

foreign import playing :: forall e. Eff (midi :: MIDI | e) Unit

foreign import addEventListener :: forall e. Eff (midi :: MIDI | e) Unit

foreign import removeEventListener :: forall e. Eff (midi :: MIDI | e) Unit

foreign import getData :: forall e. Eff (midi :: MIDI | e) (Array Foreign)

foreign import getTicksPerBeat :: forall e. Eff (midi :: MIDI | e) Number

foreign import logger :: forall a e. a -> Eff (midi :: MIDI | e) Unit

type InstrumentName = String

type PluginConfigRec =
  { soundfontUrl :: String
  , instrument   :: InstrumentName
  }
