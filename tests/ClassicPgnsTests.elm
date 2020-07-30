module ClassicPgnsTests exposing
    ( testParseMovesPolgarVsKasparov
    , testParseTagPairPolgarVsKasparov
    )

import Expect
import Parser exposing (deadEndsToString)
import Pgn
import Test exposing (Test, test)


testParseTagPairPolgarVsKasparov : Test
testParseTagPairPolgarVsKasparov =
    test "Test that an example PGN from wikipedia parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse polgarVsKasparovPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs polgarVsKasparovPgnTagPairParsed

                Err err ->
                    err
                        |> deadEndsToString
                        |> Expect.fail


testParseMovesPolgarVsKasparov : Test
testParseMovesPolgarVsKasparov =
    test "Test that an example PGN from wikipedia parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse polgarVsKasparovPgn of
                Ok pgn ->
                    Expect.equal pgn.moves polgarVsKasparovPgnMovesParsed

                Err err ->
                    err
                        |> deadEndsToString
                        |> Expect.fail


{-| 5th game of the 2002 match played in Russia between Judit Polgar and Garry Kasparov
<https://en.wikipedia.org/wiki/Portable_Game_Notation#Example>
-}
polgarVsKasparovPgn : String
polgarVsKasparovPgn =
    "[Event \"Russia - The Rest of the World\"]\n[Site \"Moscow RUS\"]\n[Date \"2002.09.09\"]\n[EventDate \"2002.09.08\"]\n[Round \"5\"]\n[Result \"1-0\"]\n[White \"Judit Polgar\"]\n[Black \"Garry Kasparov\"]\n[ECO \"C67\"]\n[WhiteElo \"2681\"]\n[BlackElo \"2838\"]\n[PlyCount \"84\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6 4. O-O Nxe4 5. d4 Nd6 6. Bxc6\ndxc6 7. dxe5 Nf5 8. Qxd8+ Kxd8 9. Nc3 h6 10. Rd1+ Ke8 11. h3\nBe7 12. Ne2 Nh4 13. Nxh4 Bxh4 14. Be3 Bf5 15. Nd4 Bh7 16. g4\nBe7 17. Kg2 h5 18. Nf5 Bf8 19. Kf3 Bg6 20. Rd2 hxg4+ 21. hxg4\nRh3+ 22. Kg2 Rh7 23. Kg3 f6 24. Bf4 Bxf5 25. gxf5 fxe5 26. Re1\nBd6 27. Bxe5 Kd7 28. c4 c5 29. Bxd6 cxd6 30. Re6 Rah8\n31. Rexd6+ Kc8 32. R2d5 Rh3+ 33. Kg2 Rh2+ 34. Kf3 R2h3+\n35. Ke4 b6 36. Rc6+ Kb8 37. Rd7 Rh2 38. Ke3 Rf8 39. Rcc7 Rxf5\n40. Rb7+ Kc8 41. Rdc7+ Kd8 42. Rxg7 Kc8 1-0"


polgarVsKasparovPgnTagPairParsed : List Pgn.TagPair
polgarVsKasparovPgnTagPairParsed =
    [ { title = "PlyCount", value = "84" }, { title = "BlackElo", value = "2838" }, { title = "WhiteElo", value = "2681" }, { title = "ECO", value = "C67" }, { title = "Black", value = "Garry Kasparov" }, { title = "White", value = "Judit Polgar" }, { title = "Result", value = "1-0" }, { title = "Round", value = "5" }, { title = "EventDate", value = "2002.09.08" }, { title = "Date", value = "2002.09.09" }, { title = "Site", value = "Moscow RUS" }, { title = "Event", value = "Russia - The Rest of the World" } ]


polgarVsKasparovPgnMovesParsed : List Pgn.Move
polgarVsKasparovPgnMovesParsed =
    [ { black = "e5", number = "1", white = "e4" }, { black = "Nc6", number = "2", white = "Nf3" }, { black = "Nf6", number = "3", white = "Bb5" }, { black = "Nxe4", number = "4", white = "O-O" }, { black = "Nd6", number = "5", white = "d4" }, { black = "dxc6", number = "6", white = "Bxc6" }, { black = "Nf5", number = "7", white = "dxe5" }, { black = "Kxd8", number = "8", white = "Qxd8+" }, { black = "h6", number = "9", white = "Nc3" }, { black = "Ke8", number = "10", white = "Rd1+" }, { black = "Be7", number = "11", white = "h3" }, { black = "Nh4", number = "12", white = "Ne2" }, { black = "Bxh4", number = "13", white = "Nxh4" }, { black = "Bf5", number = "14", white = "Be3" }, { black = "Bh7", number = "15", white = "Nd4" }, { black = "Be7", number = "16", white = "g4" }, { black = "h5", number = "17", white = "Kg2" }, { black = "Bf8", number = "18", white = "Nf5" }, { black = "Bg6", number = "19", white = "Kf3" }, { black = "hxg4+", number = "20", white = "Rd2" }, { black = "Rh3+", number = "21", white = "hxg4" }, { black = "Rh7", number = "22", white = "Kg2" }, { black = "f6", number = "23", white = "Kg3" }, { black = "Bxf5", number = "24", white = "Bf4" }, { black = "fxe5", number = "25", white = "gxf5" }, { black = "Bd6", number = "26", white = "Re1" }, { black = "Kd7", number = "27", white = "Bxe5" }, { black = "c5", number = "28", white = "c4" }, { black = "cxd6", number = "29", white = "Bxd6" }, { black = "Rah8", number = "30", white = "Re6" }, { black = "Kc8", number = "31", white = "Rexd6+" }, { black = "Rh3+", number = "32", white = "R2d5" }, { black = "Rh2+", number = "33", white = "Kg2" }, { black = "R2h3+", number = "34", white = "Kf3" }, { black = "b6", number = "35", white = "Ke4" }, { black = "Kb8", number = "36", white = "Rc6+" }, { black = "Rh2", number = "37", white = "Rd7" }, { black = "Rf8", number = "38", white = "Ke3" }, { black = "Rxf5", number = "39", white = "Rcc7" }, { black = "Kc8", number = "40", white = "Rb7+" }, { black = "Kd8", number = "41", white = "Rdc7+" }, { black = "Kc8", number = "42", white = "Rxg7" } ]
