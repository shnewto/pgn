module PgnFuzz exposing (fuzzTagPairTest)

import Expect
import Fuzz exposing (Fuzzer, intRange, string)
import Pgn
import Pgn.Reference as Ref
import Random
import Random.Char
import Random.Extra
import Random.String
import Shrink
import String
import Test exposing (Test, fuzz2, fuzz3)


fuzzWordWithCharSet : Int -> Int -> Random.Generator Char -> Fuzzer String
fuzzWordWithCharSet min max charSet =
    Fuzz.custom
        (Random.String.rangeLengthString min max charSet)
        Shrink.noShrink


wordFuzzer : Fuzzer String
wordFuzzer =
    Fuzz.oneOf
        [ fuzzWordWithCharSet 1 30 Random.Char.nko
        , fuzzWordWithCharSet 1 30 Random.Char.hangulJamo
        , fuzzWordWithCharSet 1 30 Random.Char.latin
        , fuzzWordWithCharSet 1 30 Random.Char.hiragana
        , fuzzWordWithCharSet 1 30 Random.Char.cyrillic
        , fuzzWordWithCharSet 1 30 Random.Char.cjkUnifiedIdeograph
        , fuzzWordWithCharSet 1 30 Random.Char.ethiopic
        , fuzzWordWithCharSet 1 30 Random.Char.latin
        , fuzzWordWithCharSet 1 30 Random.Char.latinExtendedA
        , fuzzWordWithCharSet 1 30 Random.Char.latinExtendedB
        , fuzzWordWithCharSet 1 30 Random.Char.latinExtendedC
        , fuzzWordWithCharSet 1 30 Random.Char.latinExtendedD
        , fuzzWordWithCharSet 1 30 Random.Char.generalPunctuation
        ]


fuzzTagPairTest : Test
fuzzTagPairTest =
    fuzz2 wordFuzzer (Fuzz.list wordFuzzer) "test any stings work as title/value tag pairs" <|
        \title values ->
            let
                valueRaw =
                    String.join " " values

                valueInQuotes =
                    "\"" ++ valueRaw ++ "\""

                tagPair =
                    "[ " ++ title ++ " " ++ valueInQuotes ++ " ]"

                parsed =
                    { title = title, value = valueRaw }
            in
            if String.trim title == "" || String.trim valueRaw == "" then
                Expect.pass

            else
                case Pgn.parseTagPair tagPair of
                    Ok res ->
                        Expect.equal parsed res

                    Err err ->
                        err
                            |> Pgn.parseErrorToString tagPair
                            |> Expect.fail


randomMoveTextChar : Random.Generator Char
randomMoveTextChar =
    Random.Extra.sample (String.toList Ref.movetextChars)
        |> Random.map (Maybe.withDefault '♛')


fuzzMoveText : Fuzzer String
fuzzMoveText =
    fuzzWordWithCharSet 2 10 randomMoveTextChar



-- fuzzMoveTest : Test
-- fuzzMoveTest =
--     fuzz3 (intRange 1 500) fuzzMoveText fuzzMoveText "test strings we think we support as movetext actually work as movetext" <|
--         \number white black ->
--             let
--                 move =
--                     String.fromInt number ++ " " ++ white ++ " " ++ black
--                 parsed =
--                     { black = black, number = String.fromInt number, white = white }
--             in
--             if String.trim white == "" || String.trim black == "" then
--                 Expect.pass
--             else
--                 case Pgn.parseMove move of
--                     Ok res ->
--                         Expect.equal parsed res
--                     Err err ->
--                         err
--                             |> Pgn.parseErrorToString move
--                             |> Expect.fail
-- fuzzTagParis : Fuzz Pgn.TagPair
-- fuzzTagPairs =
