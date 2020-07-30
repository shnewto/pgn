module Pgn exposing
    ( Pgn, TagPair, Move
    , parse, parseMove, parseMoves, parseTagPair, parseTagPairs
    )

{-| This is a library for parsing "Portable Game Notation" (PGN) for standard chess. PGN is a plain text standard for recording chess games. For more information check out [the Wikipedia entry on PGN](https://en.wikipedia.org/wiki/Portable_Game_Notation) or [the PGN spec itself](https://ia802908.us.archive.org/26/items/pgn-standard-1994-03-12/PGN_standard_1994-03-12.txt).


# Data Structures

@docs Pgn, TagPair, Move


# The Parsers

@docs parse, parseMove, parseMoves, parseTagPair, parseTagPairs

-}

import List.Extra exposing (mapAccuml)
import Parser
    exposing
        ( (|.)
        , (|=)
        , DeadEnd
        , Nestable(..)
        , Parser
        , Step(..)
        , chompUntil
        , chompWhile
        , getChompedString
        , loop
        , map
        , multiComment
        , oneOf
        , spaces
        , succeed
        , symbol
        )



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

[ Black "Garry Kasparov"

[ ECO "C67" ]

[ WhiteElo "2681" ]

[ BlackElo "2838" ]

[ PlyCount "84" ]

Each statement (starting with `[` and ending with `]`) is a tag pair. So the tag pair `[Result "1-0"]` would be represented in the data structure as `{ title: "Result", value: "1-0"}`

-}
type alias TagPair =
    { title : String
    , value : String
    }


{-| The `Move` data structure contains the move number and the move of each player.
A move in PGN as `42. Rxg7 Kc8` would be represented in this data structure as `{ number: "42", white: "Rxg7", black: "Kc8"}`
-}
type alias Move =
    { number : String
    , white : String
    , black : String
    }



{- Parsers -}


{-| The `parse` function expects a complete PGN as a string and returns either a PGN or a [`DeadEnd`](https://package.elm-lang.org/packages/elm/parser/latest/Parser#DeadEnd) error.
-}
parse : String -> Result (List DeadEnd) Pgn
parse pgn =
    Parser.run game pgn


{-| The `parseMove` function accepts input in the shape of a single line of [Movetext](https://en.wikipedia.org/wiki/Portable_Game_Notation#Movetext), i.e. `1. e4 e5`

        parseMove "1. e4 e5" == Ok({number: "1", white: "e4", black: "e5"})

-}
parseMove : String -> Result (List DeadEnd) Move
parseMove t =
    Parser.run turn t


{-| The `parseMoves` function accepts string input in the shape of a multiple lines of [Movetext](https://en.wikipedia.org/wiki/Portable_Game_Notation#Movetext), i.e. `1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6`

        parseMoves "1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6" == Ok([{number: "1", white: "e4", black: "e5"}, {number: "2", white: "Nf3", black: "Nc6"}, {number: "3", white: "Bb5", black: "Nf6"}])

-}
parseMoves : String -> Result (List DeadEnd) (List Move)
parseMoves t =
    Parser.run turns t


{-| The `parseTagPair` function accepts string input in the shape of a single tag pair, i.e. `[EventDate "2002.09.08"]`

        parseTagPair "[EventDate \"2002.09.08\"]" == Ok({title: "EventDate", value: "2002.09.08"})

-}
parseTagPair : String -> Result (List DeadEnd) TagPair
parseTagPair r =
    Parser.run tagPair r


{-| The `parseTagPairs` function accepts string input in the shape of a series of tag pairs, i.e. `[EventDate "2002.09.08"] [Round "5"]`

        parseTagPairs "[EventDate \"2002.09.08\"]  [Round \"5\"]" == Ok({title: "EventDate", value: "2002.09.08"}, {title: "Round", value: "5"})

-}
parseTagPairs : String -> Result (List DeadEnd) (List TagPair)
parseTagPairs r =
    Parser.run tagPairs r



{- Seven Tags (not exposed yet) -}


type alias SevenTag =
    { event : Maybe String
    , site : Maybe String
    , date : Maybe String
    , round : Maybe String
    , white : Maybe String
    , black : Maybe String
    , result : Maybe String
    }


toSevenTag : List TagPair -> SevenTag
toSevenTag roster =
    let
        sevenTag =
            { event = Nothing
            , site = Nothing
            , date = Nothing
            , round = Nothing
            , white = Nothing
            , black = Nothing
            , result = Nothing
            }

        update a b =
            ( checkTag a b, [] )

        ( res, _ ) =
            mapAccuml update sevenTag roster

        checkTag st r =
            case String.toLower r.title of
                "event" ->
                    { st | event = Just r.value }

                "site" ->
                    { st | site = Just r.value }

                "date" ->
                    { st | date = Just r.value }

                "round" ->
                    { st | round = Just r.value }

                "white" ->
                    { st | white = Just r.value }

                "black" ->
                    { st | black = Just r.value }

                "result" ->
                    { st | result = Just r.value }

                _ ->
                    st
    in
    res



{- Internal -}


chompUntilWhitespace : Parser ()
chompUntilWhitespace =
    chompWhile (\c -> c /= ' ' && c /= '\t' && c /= '\n' && c /= '\u{000D}')


tagPair : Parser TagPair
tagPair =
    succeed TagPair
        |. spaces
        |. symbol "["
        |. spaces
        |= (getChompedString <| chompUntilWhitespace)
        |. spaces
        |. symbol "\""
        |= (getChompedString <| chompUntil "\"")
        |. symbol "\""
        |. spaces
        |. symbol "]"
        |. spaces


tagPairs : Parser (List TagPair)
tagPairs =
    let
        rosterHelp items =
            oneOf
                [ succeed (\item -> Loop (item :: items))
                    |= tagPair
                , succeed ()
                    |> map (\_ -> Done items)
                ]
    in
    loop [] rosterHelp


commentBlock : Parser (Maybe String)
commentBlock =
    oneOf
        [ succeed Just
            |= (getChompedString <| multiComment "{" "}" Nestable)
        , succeed Nothing
        ]


endOfLineComment : Parser (Maybe String)
endOfLineComment =
    oneOf
        [ succeed Just
            |. symbol ";"
            |. spaces
            |= (getChompedString <| chompUntil "\n")
        , succeed Nothing
        ]


move : Parser String
move =
    getChompedString <|
        succeed ()
            |. chompWhile (\c -> Char.isAlphaNum c || c == '+' || c == '#' || c == '-')


turn : Parser Move
turn =
    succeed Move
        |. spaces
        |= (getChompedString <| chompWhile Char.isDigit)
        |. symbol "."
        |. spaces
        |. commentBlock
        |. spaces
        |= move
        |. spaces
        |. commentBlock
        |. spaces
        |. chompWhile (\c -> Char.isDigit c || c == '.')
        |. spaces
        |. commentBlock
        |. spaces
        |= move
        |. spaces
        |. commentBlock
        |. spaces
        |. endOfLineComment
        |. spaces


turns : Parser (List Move)
turns =
    let
        turnsHelp items =
            oneOf
                [ succeed (\item -> Loop (item :: items))
                    |= turn
                , succeed ()
                    |> map (\_ -> Done <| List.reverse items)
                ]
    in
    loop [] turnsHelp


game : Parser Pgn
game =
    succeed Pgn
        |= tagPairs
        |= turns
