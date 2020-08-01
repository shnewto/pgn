module DocExamplesTests exposing (testParseErrorToString, testParseMoveExample, testParseMovesExample, testParseReadmeCommentExample, testParseTagPair, testParseTagPairs)

import Expect
import Pgn
import Test exposing (Test, test)


testParseMoveExample : Test
testParseMoveExample =
    let
        move =
            "1. e4 e5"

        moveParsed =
            Ok { number = "1", white = "e4", black = "e5" }
    in
    test "Test that the example used in the parseMove docs produces an expected result" <|
        \_ ->
            Expect.equal moveParsed <| Pgn.parseMove move


testParseMovesExample : Test
testParseMovesExample =
    let
        moves =
            "1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6"

        movesParsed =
            Ok
                [ { number = "1"
                  , white = "e4"
                  , black = "e5"
                  }
                , { number = "2", white = "Nf3", black = "Nc6" }
                , { number = "3", white = "Bb5", black = "Nf6" }
                ]
    in
    test "Test that the example used in the parseMoves docs produces an expected result" <|
        \_ ->
            Expect.equal movesParsed <| Pgn.parseMoves moves


testParseTagPair : Test
testParseTagPair =
    let
        pair =
            "[EventDate \"2002.09.08\"]"

        pairParsed =
            Ok { title = "EventDate", value = "2002.09.08" }
    in
    test "Test that the example used in the parseTagPair docs produces an expected result" <|
        \_ ->
            Expect.equal pairParsed <| Pgn.parseTagPair pair


testParseTagPairs : Test
testParseTagPairs =
    let
        pairs =
            "[EventDate \"2002.09.08\"]  [Round \"5\"]"

        pairsParsed =
            Ok
                [ { title = "EventDate"
                  , value = "2002.09.08"
                  }
                , { title = "Round", value = "5" }
                ]
    in
    test "Test that the example used in the parseTagPairs docs produces an expected result" <|
        \_ ->
            Expect.equal pairsParsed <| Pgn.parseTagPairs pairs


testParseErrorToString : Test
testParseErrorToString =
    let
        tagPair =
            "[Event After the title everything else in the tag pair needs to be in quotes!]"

        parsedTagPair =
            Pgn.parseTagPair tagPair

        expectedErrorString =
            """error on row:  1, col: 8. Problem: Expecting '"'

> '[Event After the title everything else in the tag pair needs to be in quotes!]'
vent 'A'fter """
    in
    test "Test that the example used in the parseErrorToString docs produces an expected result" <|
        \_ ->
            case parsedTagPair of
                Ok _ ->
                    Expect.fail <| "Should not have parsed '" ++ tagPair ++ "'"

                Err err ->
                    Expect.equal expectedErrorString <| Pgn.parseErrorToString tagPair err


testParseReadmeCommentExample : Test
testParseReadmeCommentExample =
    let
        moves =
            """
            1. {a nice handshake to get the game going} d4 {Queen's Pawn} 1... f5 {Dutch defense}
            2. a3 2.. h6; Theory's been thrown out the window!"
            """

        movesParsed =
            Ok
                [ { black = "f5", number = "1", white = "d4" }
                , { black = "h6", number = "2", white = "a3" }
                ]
    in
    test "Test that the inline and end-of-line comment examples from the README.md actually work!" <|
        \_ ->
            Expect.equal movesParsed <| Pgn.parseMoves moves
