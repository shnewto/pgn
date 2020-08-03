module PgnTests exposing
    ( testParseTurnInlineComments
    , testParseTurnNoComments
    , testParseTurnsEolComments
    , testPropTestFailSenario_01
    , testPropTestFailSenario_02
    , testPropTestFailSenario_03
    , testPropTestFailSenario_04
    )

import Expect
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
                        |> Pgn.parseErrorToString turn
                        |> Expect.fail


testParseTurnInlineComments : Test
testParseTurnInlineComments =
    let
        turn =
            "11. {[some comments] [and more]} Bd2 {another set} 11... {even more} Ne3 {lastly, these}"

        res =
            { black = "Ne3", number = "11", white = "Bd2" }
    in
    test "Test that a turn with inline comments parses correctly" <|
        \_ ->
            case Pgn.parseMove turn of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> Pgn.parseErrorToString turn
                        |> Expect.fail


testParseTurnsEolComments : Test
testParseTurnsEolComments =
    let
        turns =
            "11. Bd2 11... Ne3; comment on turn 11\n12. Qe2 12... Nc2+; comment on turn 12\n13. Kf1 13... Nxa1; comment on turn 13\n"

        res =
            [ { black = "Ne3"
              , number = "11"
              , white = "Bd2"
              }
            , { black = "Nc2+"
              , number = "12"
              , white = "Qe2"
              }
            , { black = "Nxa1"
              , number = "13"
              , white = "Kf1"
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
                        |> Pgn.parseErrorToString turns
                        |> Expect.fail


testPropTestFailSenario_01 : Test
testPropTestFailSenario_01 =
    let
        tagpair =
            "[! \"!\"]"

        res =
            { title = "!"
            , value = "!"
            }
    in
    test "Test a failure scenario from a proptest has been addressed chapter 1" <|
        \_ ->
            case Pgn.parseTagPair tagpair of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> Pgn.parseErrorToString tagpair
                        |> Expect.fail


testPropTestFailSenario_02 : Test
testPropTestFailSenario_02 =
    let
        move =
            "0 όμX 7بسlე"

        res =
            { black = "7بسlე"
            , number = "0"
            , white = "όμX"
            }
    in
    test "Test a failure scenario from a proptest has been addressed chapter 2" <|
        \_ ->
            case Pgn.parseMove move of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> Pgn.parseErrorToString move
                        |> Expect.fail


testPropTestFailSenario_03 : Test
testPropTestFailSenario_03 =
    let
        move =
            "0 hறխοṃտ 5σอ"

        res =
            { black = "5σอ"
            , number = "0"
            , white = "hறխοṃտ"
            }
    in
    test "Test a failure scenario from a proptest has been addressed chapter 3" <|
        \_ ->
            case Pgn.parseMove move of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> Pgn.parseErrorToString move
                        |> Expect.fail


testPropTestFailSenario_04 : Test
testPropTestFailSenario_04 =
    let
        move =
            "0 ാsCവクWờี메బ 6キযøোľξം"

        res =
            { black = "6キযøোľξം"
            , number = "0"
            , white = "ാsCവクWờี메బ"
            }
    in
    test "Test a failure scenario from a proptest has been addressed chapter 4" <|
        \_ ->
            case Pgn.parseMove move of
                Ok t ->
                    Expect.equal t res

                Err err ->
                    err
                        |> Pgn.parseErrorToString move
                        |> Expect.fail
