module WikipediaPgnTests exposing (testParseMovesWikipedia, testParseTagPairWikipedia)

import Expect
import Pgn
import Test exposing (Test, test)


testParseTagPairWikipedia : Test
testParseTagPairWikipedia =
    test "Test that an example PGN from wikipedia parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse wikipediaPgn of
                Ok pgn ->
                    Expect.equal pgn.tagPairs sampleWikipediaPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString wikipediaPgn
                        |> Expect.fail


testParseMovesWikipedia : Test
testParseMovesWikipedia =
    test "Test that an example PGN from wikipedia parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse wikipediaPgn of
                Ok pgn ->
                    Expect.equal pgn.moves sampleWikipediaPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString wikipediaPgn
                        |> Expect.fail


{-| 29th game of the 1992 match played in Yugoslavia between Bobby Fischer and Boris Spassky
<https://en.wikipedia.org/wiki/Portable_Game_Notation#Example>
-}
wikipediaPgn : String
wikipediaPgn =
    "[Event \"F/S Remove Match\"]\n[Site \"Belgrade, Serbia JUG\"]\n[Date \"1992.11.04\"]\n[Round \"29\"]\n[White \"Fischer, Robert J.\"]\n[Black \"Spassky, Boris V.\"]\n[Result \"1/2-1/2\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 {This opening is called the Ruy Lopez.}\n4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 d6 8. c3 O-O 9. h3 Nb8 10. d4 Nbd7\n11. c4 c6 12. cxb5 axb5 13. Nc3 Bb7 14. Bg5 b4 15. Nb1 h6 16. Bh4 c5 17. dxe5\nNxe4 18. Bxe7 Qxe7 19. exd6 Qf6 20. Nbd2 Nxd6 21. Nc4 Nxc4 22. Bxc4 Nb6\n23. Ne5 Rae8 24. Bxf7+ Rxf7 25. Nxf7 Rxe1+ 26. Qxe1 Kxf7 27. Qe3 Qg5 28. Qxg5\nhxg5 29. b3 Ke6 30. a3 Kd6 31. axb4 cxb4 32. Ra5 Nd5 33. f3 Bc8 34. Kf2 Bf5\n35. Ra7 g6 36. Ra6+ Kc5 37. Ke1 Nf4 38. g3 Nxh3 39. Kd2 Kb5 40. Rd6 Kc5 41. Ra6\nNf2 42. g4 Bd3 43. Re6 1/2-1/2"


sampleWikipediaPgnTagPairParsed : List Pgn.TagPair
sampleWikipediaPgnTagPairParsed =
    [ { title = "Result", value = "1/2-1/2" }, { title = "Black", value = "Spassky, Boris V." }, { title = "White", value = "Fischer, Robert J." }, { title = "Round", value = "29" }, { title = "Date", value = "1992.11.04" }, { title = "Site", value = "Belgrade, Serbia JUG" }, { title = "Event", value = "F/S Remove Match" } ]


sampleWikipediaPgnMovesParsed : List Pgn.Move
sampleWikipediaPgnMovesParsed =
    [ { black = "e5", number = "1", white = "e4" }, { black = "Nc6", number = "2", white = "Nf3" }, { black = "a6", number = "3", white = "Bb5" }, { black = "Nf6", number = "4", white = "Ba4" }, { black = "Be7", number = "5", white = "O-O" }, { black = "b5", number = "6", white = "Re1" }, { black = "d6", number = "7", white = "Bb3" }, { black = "O-O", number = "8", white = "c3" }, { black = "Nb8", number = "9", white = "h3" }, { black = "Nbd7", number = "10", white = "d4" }, { black = "c6", number = "11", white = "c4" }, { black = "axb5", number = "12", white = "cxb5" }, { black = "Bb7", number = "13", white = "Nc3" }, { black = "b4", number = "14", white = "Bg5" }, { black = "h6", number = "15", white = "Nb1" }, { black = "c5", number = "16", white = "Bh4" }, { black = "Nxe4", number = "17", white = "dxe5" }, { black = "Qxe7", number = "18", white = "Bxe7" }, { black = "Qf6", number = "19", white = "exd6" }, { black = "Nxd6", number = "20", white = "Nbd2" }, { black = "Nxc4", number = "21", white = "Nc4" }, { black = "Nb6", number = "22", white = "Bxc4" }, { black = "Rae8", number = "23", white = "Ne5" }, { black = "Rxf7", number = "24", white = "Bxf7+" }, { black = "Rxe1+", number = "25", white = "Nxf7" }, { black = "Kxf7", number = "26", white = "Qxe1" }, { black = "Qg5", number = "27", white = "Qe3" }, { black = "hxg5", number = "28", white = "Qxg5" }, { black = "Ke6", number = "29", white = "b3" }, { black = "Kd6", number = "30", white = "a3" }, { black = "cxb4", number = "31", white = "axb4" }, { black = "Nd5", number = "32", white = "Ra5" }, { black = "Bc8", number = "33", white = "f3" }, { black = "Bf5", number = "34", white = "Kf2" }, { black = "g6", number = "35", white = "Ra7" }, { black = "Kc5", number = "36", white = "Ra6+" }, { black = "Nf4", number = "37", white = "Ke1" }, { black = "Nxh3", number = "38", white = "g3" }, { black = "Kb5", number = "39", white = "Kd2" }, { black = "Kc5", number = "40", white = "Rd6" }, { black = "Nf2", number = "41", white = "Ra6" }, { black = "Bd3", number = "42", white = "g4" }, { black = "", number = "43", white = "Re6" } ]
