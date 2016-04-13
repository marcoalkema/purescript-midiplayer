module MidiJsTypes where

import Prelude
import Data.Generic

type MidiNote = { noteNumber    :: Int
                , deltaTime     :: Number
                , hasFirstTie   :: Boolean
                , hasEndingTie  :: Boolean
                , hasDot        :: Boolean }

data MidiEvent  = TrackName         { deltaTime :: Number
                                    , subtype'  :: String
                                    , text      :: String
                                    , type'     :: String }
                | InstrumentName    { deltaTime :: Number
                                    , subtype'  :: String
                                    , text      :: String
                                    , type'     :: String }
                | TimeSignature     { deltaTime     :: Number
                                    , denominator   :: Int
                                    , metronome     :: Int
                                    , numerator     :: Int
                                    , subtype'      :: String
                                    , thirtyseconds :: Int
                                    , type'         :: String }
                | KeySignature      { deltaTime :: Number
                                    , key       :: Int
                                    , scale     :: Int
                                    , subtype'  :: String
                                    , text      :: String }
                | Marker            { deltaTime :: Number
                                    , subtype'  :: String
                                    , text      :: String
                                    , type'     :: String }
                | SmpteOffset       { deltaTime :: Number
                                    , frame     :: Int
                                    , frameRate :: Int
                                    , hour      :: Int
                                    , minute    :: Int
                                    , sec       :: Int
                                    , subFrame  :: Int
                                    , subtype'  :: String
                                    , type'     :: String}
                | ProgramChange     { channel       :: Int
                                    , deltaTime     :: Number
                                    , programNumber :: Int
                                    , subtype'      :: String
                                    , type'         :: String}
                | Controller        { channel         :: Int
                                    , controllerType' :: Int
                                    , deltaTime       :: Number
                                    , type'           :: String
                                    , value           :: Int}
                | SetTempo          { deltaTime           :: Number
                                    , microsecondsPerBeat :: Int
                                    , subtype'            :: String
                                    , type'               :: String}
                | NoteOn            { channel    :: Int
                                    , deltaTime  :: Number
                                    , noteNumber :: Int
                                    , subtype'   :: String
                                    , type'      :: String
                                    , velocity   :: Int}
                | NoteOff           { channel    :: Int
                                    , deltaTime  :: Number
                                    , noteNumber :: Int
                                    , subtype'   :: String
                                    , type'      :: String
                                    , velocity   :: Int}
                | EndOfTrack        { deltaTime :: Number
                                    , subtype'  :: String
                                    , type'     :: String}
                | MidiChannelPrefix { channel   :: Int
                                    , deltaTime :: Number
                                    , subtype'  :: String
                                    , type'     :: String}
                  
derive instance eqMidiEvent :: Eq MidiEvent
derive instance genericMidiEvent :: Generic MidiEvent
instance showMidiEvent :: Show MidiEvent where
  show = gShow

