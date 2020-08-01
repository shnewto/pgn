module Pgn.Extra exposing
    ( SevenTag
    , toSevenTag
    )

{-| Convenience functions for working with Pgn


# Data Structures

@docs SevenTag


# Functions

@docs toSevenTag

-}

import List.Extra exposing (mapAccuml)
import Pgn


{-| The `SevenTag` data structure represents the standard values you'd expect to see in a PGN's tag pairs. The idea behind it is that if you want easy access to a result or the date a game took place, you shouldn't need to traverse a list!
-}
type alias SevenTag =
    { event : Maybe String
    , site : Maybe String
    , date : Maybe String
    , round : Maybe String
    , white : Maybe String
    , black : Maybe String
    , result : Maybe String
    }


{-| The `toSevenTag` function takes a list of TagPair and does the work for you to produce common / expected values from a PGN tag pair.

        pgn =
            Pgn.parse "..."

        sevenTag =
            toSevenTag pgn.tagPairs

-}
toSevenTag : List Pgn.TagPair -> SevenTag
toSevenTag pairs =
    let
        sevenTag =
            { event = Nothing
            , site = Nothing
            , date = Nothing
            , round = Nothing
            , white = Nothing
            , black = Nothing
            , result = Nothing
            }

        update a b =
            ( checkTag a b, [] )

        ( res, _ ) =
            mapAccuml update sevenTag pairs

        checkTag st r =
            case String.toLower r.title of
                "event" ->
                    { st | event = Just r.value }

                "site" ->
                    { st | site = Just r.value }

                "date" ->
                    { st | date = Just r.value }

                "round" ->
                    { st | round = Just r.value }

                "white" ->
                    { st | white = Just r.value }

                "black" ->
                    { st | black = Just r.value }

                "result" ->
                    { st | result = Just r.value }

                _ ->
                    st
    in
    res
