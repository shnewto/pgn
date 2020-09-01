module ChessComPgnTests exposing
    ( testParseMovesFromChessDotCom_01
    , testParseMovesFromChessDotCom_02
    , testParseTagPairFromChessDotCom_01
    , testParseTagPairFromChessDotCom_02
    )

import Expect
import Pgn
import Shared exposing (..)
import Test exposing (Test, test)


testParseTagPairFromChessDotCom_01 : Test
testParseTagPairFromChessDotCom_01 =
    test "Test that a PGN received from Chess.com parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn_01 of
                Ok pgn ->
                    Expect.equalLists pgn.tagPairs sampleChessDotComPgnTagPairParsed_01

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn_01
                        |> Expect.fail


testParseMovesFromChessDotCom_01 : Test
testParseMovesFromChessDotCom_01 =
    test "Test that a PGN received from Chess.com parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn_01 of
                Ok pgn ->
                    Expect.equalLists pgn.moves sampleChessDotComPgnMovesParsed_01

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn_01
                        |> Expect.fail


testParseTagPairFromChessDotCom_02 : Test
testParseTagPairFromChessDotCom_02 =
    test "Test that a second PGN received from Chess.com parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn_02 of
                Ok pgn ->
                    Expect.equalLists pgn.tagPairs sampleChessDotComPgnTagPairParsed_02

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn_02
                        |> Expect.fail


testParseMovesFromChessDotCom_02 : Test
testParseMovesFromChessDotCom_02 =
    test "Test that a second PGN received from Chess.com parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn_02 of
                Ok pgn ->
                    Expect.equalLists pgn.moves sampleChessDotComPgnMovesParsed_02

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn_02
                        |> Expect.fail
