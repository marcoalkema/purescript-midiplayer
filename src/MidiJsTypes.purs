module MidiJsTypes where

type MidiObject = { ticksToEvent :: Int
                  , event        :: MidiEvent
                  , track        :: Int
                  }

data MidiEvent  = TrackName { deltaTime :: Int
                            , subType :: String
                            , text :: String
                            , type' :: String}
                | InstrumentName { deltaTime :: Int
                                 , subType :: String
                                 , text :: String
                                 , type' :: String}
                | TimeSignature  { deltaTime :: Int
                                 , denominator :: Int
                                 , metronome :: Int
                                 , numerator :: Int
                                 , subType :: String
                                 , thirtyseconds :: Int
                                 , type' :: String}
                | KeySignature { deltaTime :: Int
                               , key :: Int
                               , scale :: Int
                               , subType :: String
                               , text :: String}
                | Marker { deltaTime :: Int
                         , subType :: String
                         , text :: String
                         , type' :: String}
                | SpmteOffset { deltaTime :: Int
                              , frame :: Int
                              , frameRate :: Int
                              , hour :: Int
                              , minute :: Int
                              , sec :: Int
                              , subFrame :: Int
                              , subType :: String
                              , type' :: String}
                | ProgramChange { channel :: Int
                                , deltaTime :: Int
                                , programNumber :: Int
                                , subType :: String
                                , type' :: String}
                | Controller { channel :: Int
                             , controllerType :: Int
                             , deltaTime :: Int
                             , deltaTime :: String
                             , type' :: String
                             , value :: Int}
                | SetTempo { deltaTime :: Int
                           , microsecondsPerBeat :: Int
                           , subType :: String
                           , type' :: String}
                | NoteOn { channel :: Int
                         , deltaTime :: Int
                         , noteNumber :: Int
                         , subType :: String
                         , type' :: String
                         , velocity :: Int}
                | NoteOff { channel :: Int
                          , deltaTime :: Int
                          , noteNumber :: Int
                          , subType :: String
                          , type' :: String
                          , velocity :: Int}
                | EndOfTrack { deltaTime :: Int
                             , subType :: String
                             , type' :: String}
