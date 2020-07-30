module PgnTests exposing
    ( testParseTurnInlineComments
    , testParseTurnNoComments
    , testParseTurnsEolComments
    )

import Expect
import Parser exposing (deadEndsToString)
import Pgn
import Test exposing (Test, test)


testParseTurnNoComments : Test
testParseTurnNoComments =
    let
        turn =
            "11. Bd2 11... Ne3"

        res =
            { number = "11", white = "Bd2", black = "Ne3" }
    in
    test "Test that a turn without comments parses correctly" <|
        \_ ->
            case Pgn.parseMove turn of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> deadEndsToString
                        |> Expect.fail


testParseTurnInlineComments : Test
testParseTurnInlineComments =
    let
        turn =
            "11. {[some comments] [and more]} Bd2 {another set} 11... {even more} Ne3 {lastly, these}"

        res =
            { number = "11", white = "Bd2", black = "Ne3" }
    in
    test "Test that a turn with inline comments parses correctly" <|
        \_ ->
            case Pgn.parseMove turn of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> deadEndsToString
                        |> Expect.fail


testParseTurnsEolComments : Test
testParseTurnsEolComments =
    let
        turns =
            "11. Bd2 11... Ne3; comment on turn 11\n12. Qe2 12... Nc2+; comment on turn 12\n13. Kf1 13... Nxa1; comment on turn 13\n"

        res =
            [ { number = "11"
              , white = "Bd2"
              , black = "Ne3"
              }
            , { number = "12"
              , white = "Qe2"
              , black = "Nc2+"
              }
            , { number = "13"
              , white = "Kf1"
              , black = "Nxa1"
              }
            ]
    in
    test "Test that a turn with EOL comments parses correctly" <|
        \_ ->
            case Pgn.parseMoves turns of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> deadEndsToString
                        |> Expect.fail
