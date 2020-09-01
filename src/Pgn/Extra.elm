module Pgn.Extra exposing
    ( SevenTag
    , toSevenTag, toString
    )

{-| Convenience functions for working with Pgn


# Data Structures

@docs SevenTag


# Functions

@docs toSevenTag, toString

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


{-| The `toString` can be helpful if you want to display a parsed PGN in a way that's _visually_ parseable. It separates each TagPair with `\n`, the TagPairs from the Moves with `\n\n`, and each Move with `\n`
-}
toString : Pgn.Pgn -> String
toString pgn =
    let
        result =
            let
                normalized title =
                    String.trim (String.toLower title)
            in
            pgn.tagPairs
                |> List.Extra.find
                    (\p ->
                        normalized p.title == "result"
                    )
                |> Maybe.map .value
                |> Maybe.withDefault ""

        tagPairs =
            pgn.tagPairs
                |> List.map
                    (\p ->
                        "[" ++ p.title ++ " \"" ++ p.value ++ "\"]"
                    )
                |> String.join "\n"

        moves =
            pgn.moves
                |> List.map
                    (\m ->
                        m.number ++ ". " ++ m.white ++ " " ++ m.black
                    )
                |> String.join "\n"
    in
    tagPairs ++ "\n\n" ++ moves ++ "\n" ++ result ++ "\n"
