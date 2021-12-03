module Test.RMRK.Syntax.Parser.Performance where

import Prelude
import Data.Array (range)
import Data.Foldable (for_)
import Effect (Effect)
import Effect.Class.Console (logShow, time, timeEnd)
import Lib.Parsing.Combinators (runParser)
import RMRK.Syntax.Parser (parser)

main :: Effect Unit
main = do
  let
    r = range 0 5000
  logShow "parsing 20 000 remarks"
  _ <- time "parsing 20 000 remarks"
  for_ r \_ -> do
    let
      _ = runParser parser "rmrk::BUY::2.0.0::nftid::recipientid"

      _ = runParser parser "rmrk::LIST::2.0.0::5105000-0aff6865bed3a66b-VALHELLO-POTION_HEAL-00000001::10000000000"

      _ = runParser parser "rmrk::BURN::2.0.0::5105000-0aff6865bed3a66b-VALHELLO-POTION_HEAL-00000001"

      _ = runParser parser basejson
    pure unit
  _ <- timeEnd "parsing 20 000 remarks"
  logShow "completed"

basejson :: String
basejson =
  """
  { 
    "symbol": "sym", 
    "type": "svg", 
    "block": 1,
    "parts": [
      {
        "id": "partid",
        "type": "slot",
        "z": 1,
        "src": "gif.jpg",
        "themable": false,
        "equippable": ["item-1"]
      },
      {
        "id": "partid2",
        "type": "slot",
        "z": 2,
        "src": "gif2.jpg",
        "themable": true,
        "equippable": "*"
      },
      {
        "id": "partid3",
        "type": "slot",
        "z": 3,
        "src": "gif3.jpg",
        "themable": true,
        "equippable": "-"
      }
    ],
    "themes": {
      "default": {
        "color": "yellow"
      }
    }
  }
"""