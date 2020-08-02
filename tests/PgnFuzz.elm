module PgnFuzz exposing (fuzzTagPair)

import Array
import Expect
import Fuzz exposing (Fuzzer, string)
import Pgn
import Random
import Random.Char
import Random.String
import Shrink
import String
import Test exposing (Test, fuzz2)


fuzzWordWithCharSet : Random.Generator Char -> Fuzzer String.String
fuzzWordWithCharSet charSet =
    Fuzz.custom
        (Random.String.rangeLengthString 1 30 charSet)
        Shrink.string


wordFuzzer : Fuzzer String
wordFuzzer =
    Fuzz.oneOf
        [ fuzzWordWithCharSet Random.Char.nko
        , fuzzWordWithCharSet Random.Char.hangulJamo
        , fuzzWordWithCharSet Random.Char.latin
        , fuzzWordWithCharSet Random.Char.hiragana
        , fuzzWordWithCharSet Random.Char.cyrillic
        , fuzzWordWithCharSet Random.Char.cjkUnifiedIdeograph
        , fuzzWordWithCharSet Random.Char.ethiopic
        , fuzzWordWithCharSet Random.Char.latin
        , fuzzWordWithCharSet Random.Char.latinExtendedA
        , fuzzWordWithCharSet Random.Char.latinExtendedB
        , fuzzWordWithCharSet Random.Char.latinExtendedC
        , fuzzWordWithCharSet Random.Char.latinExtendedD
        , fuzzWordWithCharSet Random.Char.generalPunctuation
        ]


fuzzTagPair : Test
fuzzTagPair =
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
