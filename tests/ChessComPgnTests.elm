module ChessComPgnTests exposing (testParseMovesFromChessDotCom, testParseTagPairFromChessDotCom)

import Expect
import Pgn
import Test exposing (Test, test)


testParseTagPairFromChessDotCom : Test
testParseTagPairFromChessDotCom =
    test "Test that a PGN received from Chess.com parses a game's tag pair and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn of
                Ok pgn ->
                    Expect.equalLists pgn.tagPairs sampleChessDotComPgnTagPairParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn
                        |> Expect.fail


testParseMovesFromChessDotCom : Test
testParseMovesFromChessDotCom =
    test "Test that a PGN received from Chess.com parses a game's moves and produces an expected result" <|
        \_ ->
            case Pgn.parse sampleChessDotComPgn of
                Ok pgn ->
                    Expect.equalLists pgn.moves sampleChessDotComPgnMovesParsed

                Err err ->
                    err
                        |> Pgn.parseErrorToString sampleChessDotComPgn
                        |> Expect.fail


{-| flukeout vs shnewto
<https://www.chess.com/daily/game/256312384>
2020.03.27
-}
sampleChessDotComPgn : String
sampleChessDotComPgn =
    "[Event \"Let's Play!\"]\n[Site \"Chess.com\"]\n[Date \"2020.03.27\"]\n[Round \"-\"]\n[White \"flukeout\"]\n[Black \"shnewto\"]\n[Result \"0-1\"]\n[ECO \"A00\"]\n[ECOUrl \"https://www.chess.com/openings/Barnes-Opening-1...d5-2.e4\"]\n[CurrentPosition \"1q6/6p1/K1P2pk1/8/P3p3/8/8/8 w - - 0 57\"]\n[Timezone \"UTC\"]\n[UTCDate \"2020.03.27\"]\n[UTCTime \"23:53:48\"]\n[WhiteElo \"1063\"]\n[BlackElo \"1135\"]\n[TimeControl \"1/86400\"]\n[Termination \"shnewto won by resignation\"]\n[StartTime \"23:53:48\"]\n[EndDate \"2020.04.01\"]\n[EndTime \"03:59:06\"]\n[Link \"https://www.chess.com/daily/game/256312384\"]\n\n\n\n1. e4 {[%clk 23:58:08]} 1... d5 {[%clk 23:58:17]} 2. f3 {[%clk 23:47:10]} 2... e6 {[%clk 16:51:31]} 3. f4 {[%clk 16:58:58]} 3... Nc6 {[%clk 8:35:08]} 4. Bb5 {[%clk 15:40:13]} 4... a6 {[%clk 20:26:07]} 5. Bxc6+ {[%clk 23:44:00]} 5... bxc6 {[%clk 23:42:21]} 6. d3 {[%clk 23:33:23]} 6... Be7 {[%clk 23:33:48]} 7. Nf3 {[%clk 23:47:04]} 7... Nf6 {[%clk 23:29:55]} 8. Nbd2 {[%clk 23:59:32]} 8... O-O {[%clk 23:59:44]} 9. c4 {[%clk 23:48:50]} 9... Ng4 {[%clk 23:49:35]} 10. Nb3 {[%clk 23:24:29]} 10... Bb4+ {[%clk 22:33:46]} 11. Bd2 {[%clk 22:34:56]} 11... Ne3 {[%clk 23:55:33]} 12. Qe2 {[%clk 23:59:28]} 12... Nc2+ {[%clk 23:58:26]} 13. Kf1 {[%clk 23:50:43]} 13... Nxa1 {[%clk 23:57:34]} 14. Nxa1 {[%clk 23:49:02]} 14... Bc5 {[%clk 22:15:38]} 15. Nb3 {[%clk 23:56:10]} 15... Ba7 {[%clk 21:09:38]} 16. Bb4 {[%clk 14:50:14]} 16... Re8 {[%clk 23:32:31]} 17. Na5 {[%clk 23:33:56]} 17... Qf6 {[%clk 22:53:52]} 18. Nxc6 {[%clk 23:12:55]} 18... Qxf4 {[%clk 23:37:07]} 19. Bd2 {[%clk 23:45:40]} 19... Qf6 {[%clk 23:23:28]} 20. Bg5 {[%clk 23:49:25]} 20... Qg6 {[%clk 21:00:12]} 21. Ne7+ {[%clk 23:38:09]} 21... Rxe7 {[%clk 23:55:20]} 22. Bxe7 {[%clk 23:09:27]} 22... f6 {[%clk 23:19:02]} 23. Nh4 {[%clk 23:54:52]} 23... Qg5 {[%clk 22:57:30]} 24. Nf3 {[%clk 23:31:36]} 24... Qc1+ {[%clk 23:58:45]} 25. Ne1 {[%clk 23:06:54]} 25... Bd4 {[%clk 23:16:17]} 26. Ba3 {[%clk 12:53:26]} 26... Bd7 {[%clk 21:31:43]} 27. Bb4 {[%clk 23:54:07]} 27... Bxb2 {[%clk 23:52:25]} 28. Qc2 {[%clk 23:39:58]} 28... Qf4+ {[%clk 23:57:19]} 29. Ke2 {[%clk 23:57:23]} 29... Bc1 {[%clk 23:20:34]} 30. Kd1 {[%clk 23:54:19]} 30... Be3 {[%clk 23:47:28]} 31. Nf3 {[%clk 23:35:57]} 31... dxe4 {[%clk 23:24:04]} 32. dxe4 {[%clk 23:54:14]} 32... e5 {[%clk 23:30:05]} 33. Bd2 {[%clk 23:57:55]} 33... Rd8 {[%clk 23:03:01]} 34. Qd3 {[%clk 23:17:49]} 34... Ba4+ {[%clk 23:58:55]} 35. Ke2 {[%clk 23:59:08]} 35... Bd1+ {[%clk 23:58:01]} 36. Rxd1 {[%clk 23:59:11]} 36... Rxd3 {[%clk 23:58:58]} 37. Kxd3 {[%clk 23:59:34]} 37... Bxd2 {[%clk 23:56:37]} 38. Nxd2 {[%clk 23:52:18]} 38... Qxh2 {[%clk 23:58:15]} 39. c5 {[%clk 23:54:26]} 39... Qxg2 {[%clk 23:58:51]} 40. Nc4 {[%clk 23:59:33]} 40... h5 {[%clk 23:59:12]} 41. Rd2 {[%clk 23:57:24]} 41... Qf1+ {[%clk 23:57:31]} 42. Kc3 {[%clk 23:58:16]} 42... Qe1 {[%clk 23:49:46]} 43. Kb4 {[%clk 23:55:48]} 43... h4 {[%clk 23:58:52]} 44. Ka5 {[%clk 23:59:26]} 44... Qxe4 {[%clk 23:58:38]} 45. Nb2 {[%clk 23:59:04]} 45... h3 {[%clk 23:55:34]} 46. Kxa6 {[%clk 23:58:26]} 46... Qf4 {[%clk 23:58:01]} 47. Rd8+ {[%clk 23:56:16]} 47... Kf7 {[%clk 23:53:37]} 48. Rd7+ {[%clk 23:57:10]} 48... Kg6 {[%clk 23:49:04]} 49. Kb7 {[%clk 23:58:57]} 49... h2 {[%clk 23:57:14]} 50. Rd1 {[%clk 23:58:59]} 50... Qf3+ {[%clk 23:47:43]} 51. Kxc7 {[%clk 22:20:58]} 51... h1=Q {[%clk 23:35:26]} 52. Rxh1 {[%clk 23:31:34]} 52... Qxh1 {[%clk 23:59:51]} 53. c6 {[%clk 23:59:50]} 53... Qg2 {[%clk 23:52:07]} 54. Kb7 {[%clk 23:57:39]} 54... Qxb2+ {[%clk 23:59:05]} 55. Ka6 {[%clk 23:59:27]} 55... Qb8 {[%clk 23:55:45]} 56. a4 {[%clk 23:59:35]} 56... e4 {[%clk 22:52:04]} 0-1"


sampleChessDotComPgnTagPairParsed : List Pgn.TagPair
sampleChessDotComPgnTagPairParsed =
    [ { title = "Event", value = "Let's Play!" }, { title = "Site", value = "Chess.com" }, { title = "Date", value = "2020.03.27" }, { title = "Round", value = "-" }, { title = "White", value = "flukeout" }, { title = "Black", value = "shnewto" }, { title = "Result", value = "0-1" }, { title = "ECO", value = "A00" }, { title = "ECOUrl", value = "https://www.chess.com/openings/Barnes-Opening-1...d5-2.e4" }, { title = "CurrentPosition", value = "1q6/6p1/K1P2pk1/8/P3p3/8/8/8 w - - 0 57" }, { title = "Timezone", value = "UTC" }, { title = "UTCDate", value = "2020.03.27" }, { title = "UTCTime", value = "23:53:48" }, { title = "WhiteElo", value = "1063" }, { title = "BlackElo", value = "1135" }, { title = "TimeControl", value = "1/86400" }, { title = "Termination", value = "shnewto won by resignation" }, { title = "StartTime", value = "23:53:48" }, { title = "EndDate", value = "2020.04.01" }, { title = "EndTime", value = "03:59:06" }, { title = "Link", value = "https://www.chess.com/daily/game/256312384" } ]


sampleChessDotComPgnMovesParsed : List Pgn.Move
sampleChessDotComPgnMovesParsed =
    [ { black = "d5", number = "1", white = "e4" }
    , { black = "e6", number = "2", white = "f3" }
    , { black = "Nc6", number = "3", white = "f4" }
    , { black = "a6", number = "4", white = "Bb5" }
    , { black = "bxc6", number = "5", white = "Bxc6+" }
    , { black = "Be7", number = "6", white = "d3" }
    , { black = "Nf6", number = "7", white = "Nf3" }
    , { black = "O-O", number = "8", white = "Nbd2" }
    , { black = "Ng4", number = "9", white = "c4" }
    , { black = "Bb4+", number = "10", white = "Nb3" }
    , { black = "Ne3", number = "11", white = "Bd2" }
    , { black = "Nc2+", number = "12", white = "Qe2" }
    , { black = "Nxa1", number = "13", white = "Kf1" }
    , { black = "Bc5", number = "14", white = "Nxa1" }
    , { black = "Ba7", number = "15", white = "Nb3" }
    , { black = "Re8", number = "16", white = "Bb4" }
    , { black = "Qf6", number = "17", white = "Na5" }
    , { black = "Qxf4", number = "18", white = "Nxc6" }
    , { black = "Qf6", number = "19", white = "Bd2" }
    , { black = "Qg6", number = "20", white = "Bg5" }
    , { black = "Rxe7", number = "21", white = "Ne7+" }
    , { black = "f6", number = "22", white = "Bxe7" }
    , { black = "Qg5", number = "23", white = "Nh4" }
    , { black = "Qc1+", number = "24", white = "Nf3" }
    , { black = "Bd4", number = "25", white = "Ne1" }
    , { black = "Bd7", number = "26", white = "Ba3" }
    , { black = "Bxb2", number = "27", white = "Bb4" }
    , { black = "Qf4+", number = "28", white = "Qc2" }
    , { black = "Bc1", number = "29", white = "Ke2" }
    , { black = "Be3", number = "30", white = "Kd1" }
    , { black = "dxe4", number = "31", white = "Nf3" }
    , { black = "e5", number = "32", white = "dxe4" }
    , { black = "Rd8", number = "33", white = "Bd2" }
    , { black = "Ba4+", number = "34", white = "Qd3" }
    , { black = "Bd1+", number = "35", white = "Ke2" }
    , { black = "Rxd3", number = "36", white = "Rxd1" }
    , { black = "Bxd2", number = "37", white = "Kxd3" }
    , { black = "Qxh2", number = "38", white = "Nxd2" }
    , { black = "Qxg2", number = "39", white = "c5" }
    , { black = "h5", number = "40", white = "Nc4" }
    , { black = "Qf1+", number = "41", white = "Rd2" }
    , { black = "Qe1", number = "42", white = "Kc3" }
    , { black = "h4", number = "43", white = "Kb4" }
    , { black = "Qxe4", number = "44", white = "Ka5" }
    , { black = "h3", number = "45", white = "Nb2" }
    , { black = "Qf4", number = "46", white = "Kxa6" }
    , { black = "Kf7", number = "47", white = "Rd8+" }
    , { black = "Kg6", number = "48", white = "Rd7+" }
    , { black = "h2", number = "49", white = "Kb7" }
    , { black = "Qf3+", number = "50", white = "Rd1" }
    , { black = "h1=Q", number = "51", white = "Kxc7" }
    , { black = "Qxh1", number = "52", white = "Rxh1" }
    , { black = "Qg2", number = "53", white = "c6" }
    , { black = "Qxb2+", number = "54", white = "Kb7" }
    , { black = "Qb8", number = "55", white = "Ka6" }
    , { black = "e4", number = "56", white = "a4" }
    ]
