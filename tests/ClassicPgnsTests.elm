module ClassicPgnsTests exposing ( testParseMovesPolgarVsKasparov
                                 , testParseTagPairPolgarVsKasparov
                                 , testParseMovesSpasskyVsFischer
                                 , testParseTagPairSpasskyVsFischer
                                 , testParseMovesKramnikVsTopalov
                                 , testParseTagPairKramnikVsTopalov )

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

testParseMovesSpasskyVsFischer : Test
testParseMovesSpasskyVsFischer =
    test "Test that an example Spassky vs FIscher PGN parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse spasskyVsFischerPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs spasskyVsFischerPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString spasskyVsFischerPgn
                        |> Expect.fail


testParseTagPairSpasskyVsFischer : Test
testParseTagPairSpasskyVsFischer =
    test "Test that an example Spassky vs FIscher PGN parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse spasskyVsFischerPgn of
                Ok pgn ->
                    Expect.equal pgn.moves spasskyVsFischerPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString spasskyVsFischerPgn
                        |> Expect.fail

testParseMovesKramnikVsTopalov : Test
testParseMovesKramnikVsTopalov =
    test "Test that an example Kramnik vs Topalov PGN parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse kramnikVsTopalovPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs kramnikVsTopalovPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString kramnikVsTopalovPgn
                        |> Expect.fail


testParseTagPairKramnikVsTopalov : Test
testParseTagPairKramnikVsTopalov =
    test "Test that an example Kramnik vs Topalov PGN parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse kramnikVsTopalovPgn of
                Ok pgn ->
                    Expect.equal pgn.moves kramnikVsTopalovPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString kramnikVsTopalovPgn
                        |> Expect.fail