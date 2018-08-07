module Sound.Tidal.TidalToMax where

import Sound.Tidal.Context
import Sound.Tidal.Scales
import Sound.Tidal.Chords
import Sound.Tidal.OscStream

maxShape = Shape {
    params = [],
    cpsStamp = True,
    latency = 0
  }

maxSlang = OscSlang {  
    path = "/playMax",
    timestamp = NoStamp,
    namedParams = True,
    preamble = []
  }

maxStream targetip targetport = do
    s <- makeConnection targetip targetport (maxSlang)
    stream (Backend s $ (\_ _ _ -> return ())) maxShape
