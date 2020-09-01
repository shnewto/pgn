module WikipediaPgnTests exposing (testParseMovesWikipedia, testParseTagPairWikipedia)

import Expect
import Pgn
import Shared exposing (..)
import Test exposing (Test, test)


testParseTagPairWikipedia : Test
testParseTagPairWikipedia =
    test "Test that an example PGN from wikipedia parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse wikipediaPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs sampleWikipediaPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString wikipediaPgn
                        |> Expect.fail


testParseMovesWikipedia : Test
testParseMovesWikipedia =
    test "Test that an example PGN from wikipedia parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse wikipediaPgn of
                Ok pgn ->
                    Expect.equal pgn.moves sampleWikipediaPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString wikipediaPgn
                        |> Expect.fail
