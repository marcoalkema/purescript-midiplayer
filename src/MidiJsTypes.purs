module MidiJsTypes where

import Prelude
import Data.Generic

type MidiObject =  { midiEvent :: MidiEventFoo
                   , deltaTime :: Int}

type MidiEvent2 = { ticksToEvent :: Int
                  , event        :: MidiEvent
                  , track        :: Int
                  }

type MidiEvent = forall r. { deltaTime :: Int
                            , subType :: String
                            , text :: String
                            , type' :: String | r}

data MidiEventFoo  = TrackName { deltaTime :: Int
                               , subtype :: String
                               , text :: String
                               , type :: String}
                   | InstrumentName { deltaTime :: Int
                                    , subtype :: String
                                    , text :: String
                                    , type :: String}
                   | TimeSignature  { deltaTime :: Int
                                    , denominator :: Int
                                    , metronome :: Int
                                    , numerator :: Int
                                    , subtype :: String
                                    , thirtyseconds :: Int
                                    , type :: String}
                | KeySignature { deltaTime :: Int
                               , key :: Int
                               , scale :: Int
                               , subtype :: String
                               , text :: String}
                | Marker { deltaTime :: Int
                         , subtype :: String
                         , text :: String
                         , type :: String}
                | SmpteOffset { deltaTime :: Int
                              , frame :: Int
                              , frameRate :: Int
                              , hour :: Int
                              , minute :: Int
                              , sec :: Int
                              , subFrame :: Int
                              , subtype :: String
                              , type :: String}
                | ProgramChange { channel :: Int
                                , deltaTime :: Int
                                , programNumber :: Int
                                , subtype :: String
                                , type :: String}
                | Controller { channel :: Int
                             , controllerType :: Int
                             , deltaTime :: Int
                             , type :: String
                             , value :: Int}
                | SetTempo { deltaTime :: Int
                           , microsecondsPerBeat :: Int
                           , subtype :: String
                           , type :: String}
                | NoteOn { channel :: Int
                         , deltaTime :: Int
                         , noteNumber :: Int
                         , subtype :: String
                         , type :: String
                         , velocity :: Int}
                | NoteOff { channel :: Int
                          , deltaTime :: Int
                          , noteNumber :: Int
                          , subtype :: String
                          , type :: String
                          , velocity :: Int}
                | EndOfTrack { deltaTime :: Int
                             , subtype :: String
                             , type :: String}
| MidiChannelPrefix { channel :: Int
                    , deltaTime :: Int
                    , subtype :: String
                    , type :: String}
  
derive instance eqMidiEvent :: Eq MidiEventFoo
derive instance genericMidiEvent :: Generic MidiEventFoo
instance showMidiEvent :: Show MidiEventFoo where
  show = gShow

