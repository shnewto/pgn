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
        , keyword
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


polgarVsKasparovPgn =
    "[Event \"Russia - The Rest of the World\"]\n[Site \"Moscow RUS\"]\n[Date \"2002.09.09\"]\n[EventDate \"2002.09.08\"]\n[Round \"5\"]\n[Result \"1-0\"]\n[White \"Judit Polgar\"]\n[Black \"Garry Kasparov\"]\n[ECO \"C67\"]\n[WhiteElo \"2681\"]\n[BlackElo \"2838\"]\n[PlyCount \"84\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6 4. O-O Nxe4 5. d4 Nd6 6. Bxc6\ndxc6 7. dxe5 Nf5 8. Qxd8+ Kxd8 9. Nc3 h6 10. Rd1+ Ke8 11. h3\nBe7 12. Ne2 Nh4 13. Nxh4 Bxh4 14. Be3 Bf5 15. Nd4 Bh7 16. g4\nBe7 17. Kg2 h5 18. Nf5 Bf8 19. Kf3 Bg6 20. Rd2 hxg4+ 21. hxg4\nRh3+ 22. Kg2 Rh7 23. Kg3 f6 24. Bf4 Bxf5 25. gxf5 fxe5 26. Re1\nBd6 27. Bxe5 Kd7 28. c4 c5 29. Bxd6 cxd6 30. Re6 Rah8\n31. Rexd6+ Kc8 32. R2d5 Rh3+ 33. Kg2 Rh2+ 34. Kf3 R2h3+\n35. Ke4 b6 36. Rc6+ Kb8 37. Rd7 Rh2 38. Ke3 Rf8 39. Rcc7 Rxf5\n40. Rb7+ Kc8 41. Rdc7+ Kd8 42. Rxg7 Kc8 1-0"


wikipediaPgn =
    "[Event \"F/S Remove Match\"]\n[Site \"Belgrade, Serbia JUG\"]\n[Date \"1992.11.04\"]\n[Round \"29\"]\n[White \"Fischer, Robert J.\"]\n[Black \"Spassky, Boris V.\"]\n[Result \"1/2-1/2\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 {This opening is called the Ruy Lopez.}\n4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 d6 8. c3 O-O 9. h3 Nb8 10. d4 Nbd7\n11. c4 c6 12. cxb5 axb5 13. Nc3 Bb7 14. Bg5 b4 15. Nb1 h6 16. Bh4 c5 17. dxe5\nNxe4 18. Bxe7 Qxe7 19. exd6 Qf6 20. Nbd2 Nxd6 21. Nc4 Nxc4 22. Bxc4 Nb6\n23. Ne5 Rae8 24. Bxf7+ Rxf7 25. Nxf7 Rxe1+ 26. Qxe1 Kxf7 27. Qe3 Qg5 28. Qxg5\nhxg5 29. b3 Ke6 30. a3 Kd6 31. axb4 cxb4 32. Ra5 Nd5 33. f3 Bc8 34. Kf2 Bf5\n35. Ra7 g6 36. Ra6+ Kc5 37. Ke1 Nf4 38. g3 Nxh3 39. Kd2 Kb5 40. Rd6 Kc5 41. Ra6\nNf2 42. g4 Bd3 43. Re6 1/2-1/2"



-- 1-0"
{- Parsers -}


{-| The `parse` function expects a complete PGN as a string and returns either a PGN or a [`DeadEnd`](https://package.elm-lang.org/packages/elm/parser/latest/Parser#DeadEnd) error.
-}
parse : String -> Result (List DeadEnd) Pgn
parse pgn =
    Parser.run game polgarVsKasparovPgn


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
    let
        optionalMoveNumber =
            oneOf
                [ succeed ()
                    |. chompWhile Char.isDigit
                    |. chompWhile (\c -> c == '.')
                , succeed ()
                ]

        optionalResult =
            oneOf
                [ succeed ()
                    |. keyword "1-0"
                , succeed ()
                    |. keyword "0-1"
                , succeed ()
                    |. keyword "1/2-1/2"
                , succeed ()
                ]
    in
    succeed Move
        |= (getChompedString <| chompWhile Char.isDigit)
        |. symbol "."
        |. commentBlock
        |. spaces
        |= move
        |. spaces
        |. commentBlock
        |. spaces
        |. optionalMoveNumber
        |. spaces
        |. commentBlock
        |. spaces
        |= move
        |. spaces
        |. commentBlock
        |. spaces
        |. endOfLineComment
        |. spaces
        |. optionalResult


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
