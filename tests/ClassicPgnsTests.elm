module ClassicPgnsTests exposing (testParseMovesPolgarVsKasparov, testParseTagPairPolgarVsKasparov)

import Expect
import Pgn
import Shared exposing (..)
import Test exposing (Test, test)


testParseTagPairPolgarVsKasparov : Test
testParseTagPairPolgarVsKasparov =
    test "Test that an example PGN from wikipedia parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse polgarVsKasparovPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs polgarVsKasparovPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString polgarVsKasparovPgn
                        |> Expect.fail


testParseMovesPolgarVsKasparov : Test
testParseMovesPolgarVsKasparov =
    test "Test that an example PGN from wikipedia parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse polgarVsKasparovPgn of
                Ok pgn ->
                    Expect.equal pgn.moves polgarVsKasparovPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString polgarVsKasparovPgn
                        |> Expect.fail
