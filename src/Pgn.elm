module Pgn exposing
    ( Pgn, TagPair, Move
    , parse, parseMove, parseMoves, parseTagPair, parseTagPairs
    , parseErrorToString
    )

{-| This is a library for parsing "Portable Game Notation" (PGN) for standard chess. PGN is a plain text standard for recording chess games. For more information check out [the Wikipedia entry on PGN](https://en.wikipedia.org/wiki/Portable_Game_Notation) or [the PGN spec itself](https://ia802908.us.archive.org/26/items/pgn-standard-1994-03-12/PGN_standard_1994-03-12.txt).


# Data Structures

@docs Pgn, TagPair, Move


# The Parsers

@docs parse, parseMove, parseMoves, parseTagPair, parseTagPairs


# Errors

@docs parseErrorToString

-}

import List.Extra
import Parser
    exposing
        ( (|.)
        , (|=)
        , DeadEnd
        , Nestable(..)
        , Parser
        , Problem(..)
        , Step(..)
        , andThen
        , backtrackable
        , chompWhile
        , getChompedString
        , lineComment
        , loop
        , map
        , multiComment
        , oneOf
        , spaces
        , succeed
        , symbol
        , variable
        )
import Set



{- Public Data Structures -}


{-| The `Pgn` object represents a complete PGN. The tag pairs (or roster) typically contain archival or supplemental information for the game itself. And then there are the moves of the game itself.
-}
type alias Pgn =
    { tagPairs : List TagPair
    , moves : List Move
    }


{-| The `TagPair` strcuture should minimally contain what is also known as the "Seven Tag Roster" (STR). The tag pairs can extend beyond the standard seven however. A good example of a the tag pairs describing a game looks like this:

        [ Event "Russia - The Rest of the World" ]

        [ Site "Moscow RUS" ]

        [ Date "2002.09.09" ]

        [ EventDate "2002.09.08" ]

        [ Round "5" ]

        [ Result "1-0" ]

        [ White "Judit Polgar" ]

        [ Black "Garry Kasparov"]

        [ ECO "C67" ]

        [ WhiteElo "2681" ]

        [ BlackElo "2838" ]

        [ PlyCount "84" ]

Each statement (starting with `[` and ending with `]`) is a tag pair. So the tag pair `[Result "1-0"]` would be represented in the data structure as `{ title: "Result", value: "1-0"}`

It's **important** to note that tag pairs are treated something like key, value pairs and the value must be in quotes!

-}
type alias TagPair =
    { title : String
    , value : String
    }


{-| The `Move` data structure contains the move number and the move of each player.
A move in PGN like `42. Rxg7 Kc8` would be represented in this data structure as `{ number: "42", white: "Rxg7", black: "Kc8"}`
-}
type alias Move =
    { number : String
    , white : String
    , black : String
    }



{- Parsers -}


{-| The `parse` function expects a complete PGN as a string and returns either a PGN or a [`DeadEnd`](https://package.elm-lang.org/packages/elm/parser/latest/Parser#DeadEnd) error.

For more information from any errors you see, check out the `parseErrorToString` function.

-}
parse : String -> Result (List DeadEnd) Pgn
parse pgn =
    Parser.run game pgn


{-| The `parseMove` function accepts input in the shape of a single line of [Movetext](https://en.wikipedia.org/wiki/Portable_Game_Notation#Movetext), i.e. `1. e4 e5`

        parseMove "1. e4 e5" ==
            Ok { number = "1", white = "e4", black = "e5" }

-}
parseMove : String -> Result (List DeadEnd) Move
parseMove t =
    Parser.run move t


{-| The `parseMoves` function accepts string input in the shape of a multiple lines of [Movetext](https://en.wikipedia.org/wiki/Portable_Game_Notation#Movetext), i.e. `1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6`

        parseMoves "1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6" ==
            Ok
                [ { number = "1"
                  , white = "e4"
                  , black = "e5"
                  }
                , { number = "2", white = "Nf3", black = "Nc6" }
                , { number = "3", white = "Bb5", black = "Nf6" }
                ]

-}
parseMoves : String -> Result (List DeadEnd) (List Move)
parseMoves t =
    Parser.run moves t


{-| The `parseTagPair` function accepts string input in the shape of a single tag pair, i.e. `[EventDate "2002.09.08"]`

        parseTagPair "[EventDate \"2002.09.08\"]" ==
            Ok { title = "EventDate", value = "2002.09.08" }

-}
parseTagPair : String -> Result (List DeadEnd) TagPair
parseTagPair r =
    Parser.run tagPair r


{-| The `parseTagPairs` function accepts string input in the shape of a series of tag pairs, i.e. `[EventDate "2002.09.08"] [Round "5"]`

        parseTagPairs "[EventDate \"2002.09.08\"]  [Round \"5\"]" ==
            Ok
                [ { title = "EventDate"
                  , value = "2002.09.08"
                  }
                , { title = "Round", value = "5" }
                ]

-}
parseTagPairs : String -> Result (List DeadEnd) (List TagPair)
parseTagPairs r =
    Parser.run tagPairs r



{- Errors -}


{-| The `parseErrorToString` is to help pinpoint what's causing issues with a parse. It simply produces a string for human consumption that describes what the parser thinks went wrong, followed by the line of the error then the token itself in `''`. For example, attempting to parse this invalid tag pair:

        [Event After the title, everything else in the tag pair needs to be in quotes!]

would result in this output:

        error on row: 1, col: 8. Problem: Expecting '"'

        > '[Event After the title everything else in the tag pair needs to be in quotes!]'
        vent 'A'fter

It might look a little strage but last line of the error string includes a few characters to the right and to the left of the offender.

-}
parseErrorToString : String -> List DeadEnd -> String
parseErrorToString source deadEnds =
    let
        rows =
            String.split "\n" source
    in
    deadEnds
        |> List.map
            (\de ->
                let
                    row =
                        rows |> List.Extra.getAt (de.row - 1) |> Maybe.withDefault ""

                    update a _ =
                        ( a ++ " ", [] )

                    {- start with spaces to cover the lenght of the row's leading characters "> " -}
                    inital =
                        "  "

                    --
                    ( spacesToProblem, _ ) =
                        List.Extra.mapAccuml update inital <| List.range 1 de.row
                in
                "\n\nerror on row:  "
                    ++ String.fromInt de.row
                    ++ ", col: "
                    ++ String.fromInt de.col
                    ++ ". Problem: "
                    ++ problemToString de.problem
                    ++ "\n"
                    ++ "> "
                    ++ row
                    ++ "\n"
                    ++ spacesToProblem
                    ++ "^"
            )
        |> String.join ""



{- Internal -}


charIsWhitespace : Char -> Bool
charIsWhitespace c =
    c == ' ' || c == '\t' || c == '\n' || c == '\u{000D}'


tagPair : Parser TagPair
tagPair =
    succeed TagPair
        |. spaces
        |. symbol "["
        |. spaces
        |= (getChompedString <| chompWhile (\c -> not <| charIsWhitespace c))
        |. spaces
        |= (getChompedString <| multiComment "\"" "\"" Nestable)
        |. spaces
        |. symbol "]"
        |. spaces
        |> andThen (\p -> succeed <| { p | value = String.filter (\c -> c /= '"') p.value })


tagPairs : Parser (List TagPair)
tagPairs =
    let
        pairs items =
            oneOf
                [ succeed (\item -> Loop (item :: items))
                    |= tagPair
                , succeed ()
                    |> map (\_ -> Done <| List.reverse items)
                ]
    in
    loop [] pairs


maybeCommentBlock : Parser (Maybe String)
maybeCommentBlock =
    oneOf
        [ succeed Just
            |= (getChompedString <| multiComment "{" "}" Nestable)
        , succeed Nothing
        ]


movetext : Parser String
movetext =
    let
        legalFirstCharMoveText =
            [ 'a'
            , 'b'
            , 'c'
            , 'd'
            , 'e'
            , 'f'
            , 'g'
            , 'h'
            , 'K'
            , 'Q'
            , 'B'
            , 'N'
            , 'K'
            , 'n'
            , 'R'
            , 'O'
            , 'o'
            ]

        allMoveText =
            legalFirstCharMoveText
                ++ [ '1'
                   , '2'
                   , '3'
                   , '4'
                   , '5'
                   , '6'
                   , '7'
                   , '8'
                   , '-'
                   , '+'
                   , '#'
                   , '='
                   , 'x'
                   ]
    in
    variable
        { start = \c -> List.member c legalFirstCharMoveText
        , inner = \c -> List.member c allMoveText
        , reserved = Set.fromList <| [ "1-0, 0-1", "1/2-1/2" ]
        }


moveNumber : Parser String
moveNumber =
    variable
        { start = Char.isDigit
        , inner = \c -> Char.isDigit c || c == '.'
        , reserved = Set.fromList [ "1-0, 0-1", "1/2-1/2" ]
        }
        |> andThen
            (\v ->
                succeed <| String.filter Char.isDigit v
            )


move : Parser Move
move =
    let
        optional : Parser a -> Parser ()
        optional parser =
            oneOf
                [ succeed ()
                    |. parser
                , succeed ()
                ]
    in
    succeed Move
        |. spaces
        |= moveNumber
        |. spaces
        |. maybeCommentBlock
        |. spaces
        |= movetext
        |. spaces
        |. maybeCommentBlock
        |. spaces
        |. optional moveNumber
        |. spaces
        |. maybeCommentBlock
        |. spaces
        |= (getChompedString <| optional <| movetext)
        |. spaces
        |. maybeCommentBlock
        |. spaces
        |. (optional <| lineComment ";")
        |. spaces


moves : Parser (List Move)
moves =
    let
        turnsHelp items =
            oneOf
                [ succeed (\item -> Loop (item :: items))
                    |= backtrackable move
                , succeed ()
                    |> map (\_ -> Done <| List.reverse items)
                ]
    in
    loop [] turnsHelp


result : Parser String
result =
    let
        -- this is silly
        condition c =
            c == '1' || c == '2' || c == '0' || c == '/' || c == '-' || c == ' ' || c == '\t'
    in
    succeed identity
        |= (getChompedString <| chompWhile <| condition)


game : Parser Pgn
game =
    succeed Pgn
        |= tagPairs
        |= moves
        |. result


problemToString : Problem -> String
problemToString problem =
    case problem of
        Expecting s ->
            "Expecting: " ++ s

        ExpectingInt ->
            "ExpectingInt"

        ExpectingHex ->
            "ExpectingHex"

        ExpectingOctal ->
            "ExpectingOctal"

        ExpectingBinary ->
            "ExpectingBinary"

        ExpectingFloat ->
            "ExpectingFloat"

        ExpectingNumber ->
            "ExpectingNumber"

        ExpectingVariable ->
            "ExpectingVariable"

        ExpectingSymbol s ->
            "ExpectingSymbol: " ++ s

        ExpectingKeyword s ->
            "ExpectingKeyword: " ++ s

        ExpectingEnd ->
            "ExpectingEnd"

        UnexpectedChar ->
            "UnexpectedChar"

        Problem s ->
            "Problem: " ++ s

        BadRepeat ->
            "BadRepeat"
