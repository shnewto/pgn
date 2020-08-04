module PgnFuzz exposing (fuzzMoveTest, fuzzPgnTest, fuzzTagPairTest)

import Expect
import Fuzz
    exposing
        ( Fuzzer
        , custom
        , intRange
        , list
        , map
        , map2
        , map3
        , oneOf
        )
import Pgn
import Pgn.Reference as Ref
import Random
import Random.Char
import Random.Extra
import Random.String
import Shrink
import String
import Test exposing (Test, fuzz, fuzz2, fuzz3)


fuzzPgnTest : Test
fuzzPgnTest =
    fuzz fuzzPgn "test a fuzzed PGN parses" <|
        \pgn ->
            Expect.ok <| Pgn.parse pgn


fuzzTagPairTest : Test
fuzzTagPairTest =
    fuzz2 wordFuzzer (nonEmptyList wordFuzzer) "test any stings work as title/value tag pairs" <|
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
            case Pgn.parseTagPair tagPair of
                Ok res ->
                    Expect.equal parsed res

                Err err ->
                    err
                        |> Pgn.parseErrorToString tagPair
                        |> Expect.fail


fuzzMoveTest : Test
fuzzMoveTest =
    fuzz3 (intRange 1 500) fuzzMoveText fuzzMoveText "test strings we think we support as movetext actually work as movetext" <|
        \number white black ->
            let
                move =
                    String.fromInt number ++ " " ++ white ++ " " ++ black

                parsed =
                    { black = black, number = String.fromInt number, white = white }
            in
            case Pgn.parseMove move of
                Ok res ->
                    Expect.equal parsed res

                Err err ->
                    err
                        |> Pgn.parseErrorToString move
                        |> Expect.fail


fuzzWordWithCharSet : Int -> Int -> Random.Generator Char -> Fuzzer String
fuzzWordWithCharSet min max charSet =
    custom
        (Random.String.rangeLengthString min max charSet)
        Shrink.noShrink


wordFuzzer : Fuzzer String
wordFuzzer =
    oneOf
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


randomMoveTextChar : Random.Generator Char
randomMoveTextChar =
    Random.Extra.sample (String.toList Ref.movetextChars)
        |> Random.map (Maybe.withDefault '♛')


fuzzMoveText : Fuzzer String
fuzzMoveText =
    fuzzWordWithCharSet 2 10 randomMoveTextChar


fuzzTagPair : Fuzzer String
fuzzTagPair =
    let
        valueFuzzer =
            map (\a -> "\"" ++ String.join " " a ++ "\"") (nonEmptyList wordFuzzer)
    in
    map2 (\title value -> "[ " ++ title ++ " " ++ value ++ " ]") wordFuzzer valueFuzzer


fuzzMove : Fuzzer String
fuzzMove =
    map3 (\movenum white black -> String.fromInt movenum ++ " " ++ white ++ " " ++ black) (intRange 1 500) fuzzMoveText fuzzMoveText


fuzzPgn : Fuzzer String
fuzzPgn =
    let
        tagpairs =
            map (\a -> String.join "\n" a) (nonEmptyList fuzzTagPair)

        movetext =
            map (\a -> String.join " " a) (nonEmptyList fuzzMove)
    in
    map2 (\t m -> t ++ m) tagpairs movetext


nonEmptyList : Fuzzer a -> Fuzzer (List a)
nonEmptyList fuzzer =
    map2 (::) fuzzer (list fuzzer)
