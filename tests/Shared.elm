module Shared exposing (..)

import Pgn


{-| flukeout vs shnewto
<https://www.chess.com/daily/game/256312384>
2020.03.27
-}
sampleChessDotComPgn_01 : String
sampleChessDotComPgn_01 =
    "[Event \"Let's Play!\"]\n[Site \"Chess.com\"]\n[Date \"2020.03.27\"]\n[Round \"-\"]\n[White \"flukeout\"]\n[Black \"shnewto\"]\n[Result \"0-1\"]\n[ECO \"A00\"]\n[ECOUrl \"https://www.chess.com/openings/Barnes-Opening-1...d5-2.e4\"]\n[CurrentPosition \"1q6/6p1/K1P2pk1/8/P3p3/8/8/8 w - - 0 57\"]\n[Timezone \"UTC\"]\n[UTCDate \"2020.03.27\"]\n[UTCTime \"23:53:48\"]\n[WhiteElo \"1063\"]\n[BlackElo \"1135\"]\n[TimeControl \"1/86400\"]\n[Termination \"shnewto won by resignation\"]\n[StartTime \"23:53:48\"]\n[EndDate \"2020.04.01\"]\n[EndTime \"03:59:06\"]\n[Link \"https://www.chess.com/daily/game/256312384\"]\n\n\n\n1. e4 {[%clk 23:58:08]} 1... d5 {[%clk 23:58:17]} 2. f3 {[%clk 23:47:10]} 2... e6 {[%clk 16:51:31]} 3. f4 {[%clk 16:58:58]} 3... Nc6 {[%clk 8:35:08]} 4. Bb5 {[%clk 15:40:13]} 4... a6 {[%clk 20:26:07]} 5. Bxc6+ {[%clk 23:44:00]} 5... bxc6 {[%clk 23:42:21]} 6. d3 {[%clk 23:33:23]} 6... Be7 {[%clk 23:33:48]} 7. Nf3 {[%clk 23:47:04]} 7... Nf6 {[%clk 23:29:55]} 8. Nbd2 {[%clk 23:59:32]} 8... O-O {[%clk 23:59:44]} 9. c4 {[%clk 23:48:50]} 9... Ng4 {[%clk 23:49:35]} 10. Nb3 {[%clk 23:24:29]} 10... Bb4+ {[%clk 22:33:46]} 11. Bd2 {[%clk 22:34:56]} 11... Ne3 {[%clk 23:55:33]} 12. Qe2 {[%clk 23:59:28]} 12... Nc2+ {[%clk 23:58:26]} 13. Kf1 {[%clk 23:50:43]} 13... Nxa1 {[%clk 23:57:34]} 14. Nxa1 {[%clk 23:49:02]} 14... Bc5 {[%clk 22:15:38]} 15. Nb3 {[%clk 23:56:10]} 15... Ba7 {[%clk 21:09:38]} 16. Bb4 {[%clk 14:50:14]} 16... Re8 {[%clk 23:32:31]} 17. Na5 {[%clk 23:33:56]} 17... Qf6 {[%clk 22:53:52]} 18. Nxc6 {[%clk 23:12:55]} 18... Qxf4 {[%clk 23:37:07]} 19. Bd2 {[%clk 23:45:40]} 19... Qf6 {[%clk 23:23:28]} 20. Bg5 {[%clk 23:49:25]} 20... Qg6 {[%clk 21:00:12]} 21. Ne7+ {[%clk 23:38:09]} 21... Rxe7 {[%clk 23:55:20]} 22. Bxe7 {[%clk 23:09:27]} 22... f6 {[%clk 23:19:02]} 23. Nh4 {[%clk 23:54:52]} 23... Qg5 {[%clk 22:57:30]} 24. Nf3 {[%clk 23:31:36]} 24... Qc1+ {[%clk 23:58:45]} 25. Ne1 {[%clk 23:06:54]} 25... Bd4 {[%clk 23:16:17]} 26. Ba3 {[%clk 12:53:26]} 26... Bd7 {[%clk 21:31:43]} 27. Bb4 {[%clk 23:54:07]} 27... Bxb2 {[%clk 23:52:25]} 28. Qc2 {[%clk 23:39:58]} 28... Qf4+ {[%clk 23:57:19]} 29. Ke2 {[%clk 23:57:23]} 29... Bc1 {[%clk 23:20:34]} 30. Kd1 {[%clk 23:54:19]} 30... Be3 {[%clk 23:47:28]} 31. Nf3 {[%clk 23:35:57]} 31... dxe4 {[%clk 23:24:04]} 32. dxe4 {[%clk 23:54:14]} 32... e5 {[%clk 23:30:05]} 33. Bd2 {[%clk 23:57:55]} 33... Rd8 {[%clk 23:03:01]} 34. Qd3 {[%clk 23:17:49]} 34... Ba4+ {[%clk 23:58:55]} 35. Ke2 {[%clk 23:59:08]} 35... Bd1+ {[%clk 23:58:01]} 36. Rxd1 {[%clk 23:59:11]} 36... Rxd3 {[%clk 23:58:58]} 37. Kxd3 {[%clk 23:59:34]} 37... Bxd2 {[%clk 23:56:37]} 38. Nxd2 {[%clk 23:52:18]} 38... Qxh2 {[%clk 23:58:15]} 39. c5 {[%clk 23:54:26]} 39... Qxg2 {[%clk 23:58:51]} 40. Nc4 {[%clk 23:59:33]} 40... h5 {[%clk 23:59:12]} 41. Rd2 {[%clk 23:57:24]} 41... Qf1+ {[%clk 23:57:31]} 42. Kc3 {[%clk 23:58:16]} 42... Qe1 {[%clk 23:49:46]} 43. Kb4 {[%clk 23:55:48]} 43... h4 {[%clk 23:58:52]} 44. Ka5 {[%clk 23:59:26]} 44... Qxe4 {[%clk 23:58:38]} 45. Nb2 {[%clk 23:59:04]} 45... h3 {[%clk 23:55:34]} 46. Kxa6 {[%clk 23:58:26]} 46... Qf4 {[%clk 23:58:01]} 47. Rd8+ {[%clk 23:56:16]} 47... Kf7 {[%clk 23:53:37]} 48. Rd7+ {[%clk 23:57:10]} 48... Kg6 {[%clk 23:49:04]} 49. Kb7 {[%clk 23:58:57]} 49... h2 {[%clk 23:57:14]} 50. Rd1 {[%clk 23:58:59]} 50... Qf3+ {[%clk 23:47:43]} 51. Kxc7 {[%clk 22:20:58]} 51... h1=Q {[%clk 23:35:26]} 52. Rxh1 {[%clk 23:31:34]} 52... Qxh1 {[%clk 23:59:51]} 53. c6 {[%clk 23:59:50]} 53... Qg2 {[%clk 23:52:07]} 54. Kb7 {[%clk 23:57:39]} 54... Qxb2+ {[%clk 23:59:05]} 55. Ka6 {[%clk 23:59:27]} 55... Qb8 {[%clk 23:55:45]} 56. a4 {[%clk 23:59:35]} 56... e4 {[%clk 22:52:04]} 0-1"


sampleChessDotComPgnTagPairParsed_01 : List Pgn.TagPair
sampleChessDotComPgnTagPairParsed_01 =
    [ { title = "Event", value = "Let's Play!" }, { title = "Site", value = "Chess.com" }, { title = "Date", value = "2020.03.27" }, { title = "Round", value = "-" }, { title = "White", value = "flukeout" }, { title = "Black", value = "shnewto" }, { title = "Result", value = "0-1" }, { title = "ECO", value = "A00" }, { title = "ECOUrl", value = "https://www.chess.com/openings/Barnes-Opening-1...d5-2.e4" }, { title = "CurrentPosition", value = "1q6/6p1/K1P2pk1/8/P3p3/8/8/8 w - - 0 57" }, { title = "Timezone", value = "UTC" }, { title = "UTCDate", value = "2020.03.27" }, { title = "UTCTime", value = "23:53:48" }, { title = "WhiteElo", value = "1063" }, { title = "BlackElo", value = "1135" }, { title = "TimeControl", value = "1/86400" }, { title = "Termination", value = "shnewto won by resignation" }, { title = "StartTime", value = "23:53:48" }, { title = "EndDate", value = "2020.04.01" }, { title = "EndTime", value = "03:59:06" }, { title = "Link", value = "https://www.chess.com/daily/game/256312384" } ]


sampleChessDotComPgnMovesParsed_01 : List Pgn.Move
sampleChessDotComPgnMovesParsed_01 =
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

{-| 2nd round of the World Chess Championship 2006 played in Russia between Veselin Topalov and Vladimir Kramnik
<https://en.wikipedia.org/wiki/World_Chess_Championship_2006>
-}
kramnikVsTopalovPgn : String
kramnikVsTopalovPgn =
    "[Event \"Kramnik - Topalov World Championship Match\"]\n[Site \"Elista RUS\"]\n[Date \"2006.09.24\"]\n[EventDate \"?\"]\n[Round \"2\"]\n[Result \"0-1\"]\n[White \"Veselin Topalov\"]\n[Black \"Vladimir Kramnik\"]\n[ECO \"D18\"]\n[WhiteElo \"?\"]\n[BlackElo \"?\"]\n[PlyCount \"126\"]\n\n1. d4 d5 2. c4 c6 3. Nc3 Nf6 4. Nf3 dxc4 5. a4 Bf5 6. e3 e6 7. Bxc4 Bb4 8. O-O Nbd7 9. Qe2 Bg6 10. e4 O-O 11. Bd3 Bh5 12. e5 Nd5 13. Nxd5 cxd5 14. Qe3 Bg6 15. Ng5 Re8 16. f4 Bxd3 17. Qxd3 f5 18. Be3 Nf8 19. Kh1 Rc8 20. g4 Qd7 21. Rg1 Be7 22. Nf3 Rc4 23. Rg2 fxg4 24. Rxg4 Rxa4 25. Rag1 g6 26. h4 Rb4 27. h5 Qb5 28. Qc2 Rxb2 29. hxg6 h5 30. g7 hxg4 31. gxf8=Q+ Bxf8 32. Qg6+ Bg7 33. f5 Re7 34. f6 Qe2 35. Qxg4 Rf7 36. Rc1 Rc2 37. Rxc2 Qd1+ 38. Kg2 Qxc2+ 39. Kg3 Qe4 40. Bf4 Qf5 41. Qxf5 exf5 42. Bg5 a 45 43. Kf4 a 45 44. Kxf5 a 45 45 45 45 46. Bxa3 Bf8 47. e6 Rc7 48. e7 Bxe7 49. Bxe7 Rxe7 50. fxe7 Rxe7 51. Kxd5 Bxe7 52. fxe7 Rxe7 53. Kxd5 Re1 54. d5 Kf8 55. Ne6+ Ke8 56. Nc7+ Kd8 57. Ne6+ Kc8 58. Ke7 Rh1 59. Ng5 b5 60. d6 Rd1 61. Ne6 Re1 62. d7+ 0-1"

kramnikVsTopalovPgnTagPairParsed: List Pgn.TagPair
kramnikVsTopalovPgnTagPairParsed = [{ title = "Event", value = "Kramnik - Topalov World Championship Match" },{ title = "Site", value = "Elista RUS" },{ title = "Date", value = "2006.09.24" },{ title = "EventDate", value = "?" },{ title = "Round", value = "2" },{ title = "Result", value = "0-1" },{ title = "White", value = "Veselin Topalov" },{ title = "Black", value = "Vladimir Kramnik" },{ title = "ECO", value = "D18" },{ title = "WhiteElo", value = "?" },{ title = "BlackElo", value = "?" },{ title = "PlyCount", value = "126" }]

kramnikVsTopalovPgnMovesParsed : List Pgn.Move
kramnikVsTopalovPgnMovesParsed = [{ black = "d5", number = "1", white = "d4" },{ black = "c6", number = "2", white = "c4" },{ black = "Nf6", number = "3", white = "Nc3" },{ black = "dxc4", number = "4", white = "Nf3" },{ black = "Bf5", number = "5", white = "a4" },{ black = "e6", number = "6", white = "e3" },{ black = "Bb4", number = "7", white = "Bxc4" },{ black = "Nbd7", number = "8", white = "O-O" },{ black = "Bg6", number = "9", white = "Qe2" },{ black = "O-O", number = "10", white = "e4" },{ black = "Bh5", number = "11", white = "Bd3" },{ black = "Nd5", number = "12", white = "e5" },{ black = "cxd5", number = "13", white = "Nxd5" },{ black = "Bg6", number = "14", white = "Qe3" },{ black = "Re8", number = "15", white = "Ng5" },{ black = "Bxd3", number = "16", white = "f4" },{ black = "f5", number = "17", white = "Qxd3" },{ black = "Nf8", number = "18", white = "Be3" },{ black = "Rc8", number = "19", white = "Kh1" },{ black = "Qd7", number = "20", white = "g4" },{ black = "Be7", number = "21", white = "Rg1" },{ black = "Rc4", number = "22", white = "Nf3" },{ black = "fxg4", number = "23", white = "Rg2" },{ black = "Rxa4", number = "24", white = "Rxg4" },{ black = "g6", number = "25", white = "Rag1" },{ black = "Rb4", number = "26", white = "h4" },{ black = "Qb5", number = "27", white = "h5" },{ black = "Rxb2", number = "28", white = "Qc2" },{ black = "h5", number = "29", white = "hxg6" },{ black = "hxg4", number = "30", white = "g7" },{ black = "Bxf8", number = "31", white = "gxf8=Q+" },{ black = "Bg7", number = "32", white = "Qg6+" },{ black = "Re7", number = "33", white = "f5" },{ black = "Qe2", number = "34", white = "f6" },{ black = "Rf7", number = "35", white = "Qxg4" },{ black = "Rc2", number = "36", white = "Rc1" },{ black = "Qd1+", number = "37", white = "Rxc2" },{ black = "Qxc2+", number = "38", white = "Kg2" },{ black = "Qe4", number = "39", white = "Kg3" },{ black = "Qf5", number = "40", white = "Bf4" },{ black = "exf5", number = "41", white = "Qxf5" },{ black = "a", number = "42", white = "Bg5" },{ black = "Kf4", number = "45", white = "43." }]

{-| 1st round of the World Chess Championship 1972 played in Iceland between Boris Spassky and Bobby Fischer
<https://en.wikipedia.org/wiki/World_Chess_Championship_1972>
-}
spasskyVsFischerPgn : String
spasskyVsFischerPgn =
    "[Event \"Spassky - Fischer World Championship Match\"]\n[Site \"Reykjavik ISL\"]\n[Date \"1972.07.11\"]\n[EventDate \"?\"]\n[Round \"1\"]\n[Result \"1-0\"]\n[White \"Boris Spassky\"]\n[Black \"Robert James Fischer\"]\n[ECO \"E56\"]\n[WhiteElo \"?\"]\n[BlackElo \"?\"]\n[PlyCount \"111\"]\n\n1. d4 Nf6 2. c4 e6 3. Nf3 d5 4. Nc3 Bb4 5. e3 O-O 6. Bd3 c5\n7. O-O Nc6 8. a3 Ba5 9. Ne2 dxc4 10. Bxc4 Bb6 11. dxc5 Qxd1\n12. Rxd1 Bxc5 13. b4 Be7 14. Bb2 Bd7 15. Rac1 Rfd8 16. Ned4\nNxd4 17. Nxd4 Ba4 18. Bb3 Bxb3 19. Nxb3 Rxd1+ 20. Rxd1 Rc8\n21. Kf1 Kf8 22. Ke2 Ne4 23. Rc1 Rxc1 24. Bxc1 f6 25. Na5 Nd6\n26. Kd3 Bd8 27. Nc4 Bc7 28. Nxd6 Bxd6 29. b5 Bxh2 30. g3 h5\n31. Ke2 h4 32. Kf3 Ke7 33. Kg2 hxg3 34. fxg3 Bxg3 35. Kxg3 Kd6\n36. a4 Kd5 37. Ba3 Ke4 38. Bc5 a6 39. b6 f5 40. Kh4 f4\n41. exf4 Kxf4 42. Kh5 Kf5 43. Be3 Ke4 44. Bf2 Kf5 45. Bh4 e5\n46. Bg5 e4 47. Be3 Kf6 48. Kg4 Ke5 49. Kg5 Kd5 50. Kf5 a5\n51. Bf2 g5 52. Kxg5 Kc4 53. Kf5 Kb4 54. Kxe4 Kxa4 55. Kd5 Kb5\n56. Kd6 1-0"

spasskyVsFischerPgnTagPairParsed : List Pgn.TagPair
spasskyVsFischerPgnTagPairParsed = [{ title = "Event", value = "Spassky - Fischer World Championship Match" },{ title = "Site", value = "Reykjavik ISL" },{ title = "Date", value = "1972.07.11" },{ title = "EventDate", value = "?" },{ title = "Round", value = "1" },{ title = "Result", value = "1-0" },{ title = "White", value = "Boris Spassky" },{ title = "Black", value = "Robert James Fischer" },{ title = "ECO", value = "E56" },{ title = "WhiteElo", value = "?" },{ title = "BlackElo", value = "?" },{ title = "PlyCount", value = "111" }]

spasskyVsFischerPgnMovesParsed : List Pgn.Move
spasskyVsFischerPgnMovesParsed = [{ black = "Nf6", number = "1", white = "d4" },{ black = "e6", number = "2", white = "c4" },{ black = "d5", number = "3", white = "Nf3" },{ black = "Bb4", number = "4", white = "Nc3" },{ black = "O-O", number = "5", white = "e3" },{ black = "c5", number = "6", white = "Bd3" },{ black = "Nc6", number = "7", white = "O-O" },{ black = "Ba5", number = "8", white = "a3" },{ black = "dxc4", number = "9", white = "Ne2" },{ black = "Bb6", number = "10", white = "Bxc4" },{ black = "Qxd1", number = "11", white = "dxc5" },{ black = "Bxc5", number = "12", white = "Rxd1" },{ black = "Be7", number = "13", white = "b4" },{ black = "Bd7", number = "14", white = "Bb2" },{ black = "Rfd8", number = "15", white = "Rac1" },{ black = "Nxd4", number = "16", white = "Ned4" },{ black = "Ba4", number = "17", white = "Nxd4" },{ black = "Bxb3", number = "18", white = "Bb3" },{ black = "Rxd1+", number = "19", white = "Nxb3" },{ black = "Rc8", number = "20", white = "Rxd1" },{ black = "Kf8", number = "21", white = "Kf1" },{ black = "Ne4", number = "22", white = "Ke2" },{ black = "Rxc1", number = "23", white = "Rc1" },{ black = "f6", number = "24", white = "Bxc1" },{ black = "Nd6", number = "25", white = "Na5" },{ black = "Bd8", number = "26", white = "Kd3" },{ black = "Bc7", number = "27", white = "Nc4" },{ black = "Bxd6", number = "28", white = "Nxd6" },{ black = "Bxh2", number = "29", white = "b5" },{ black = "h5", number = "30", white = "g3" },{ black = "h4", number = "31", white = "Ke2" },{ black = "Ke7", number = "32", white = "Kf3" },{ black = "hxg3", number = "33", white = "Kg2" },{ black = "Bxg3", number = "34", white = "fxg3" },{ black = "Kd6", number = "35", white = "Kxg3" },{ black = "Kd5", number = "36", white = "a4" },{ black = "Ke4", number = "37", white = "Ba3" },{ black = "a6", number = "38", white = "Bc5" },{ black = "f5", number = "39", white = "b6" },{ black = "f4", number = "40", white = "Kh4" },{ black = "Kxf4", number = "41", white = "exf4" },{ black = "Kf5", number = "42", white = "Kh5" },{ black = "Ke4", number = "43", white = "Be3" },{ black = "Kf5", number = "44", white = "Bf2" },{ black = "e5", number = "45", white = "Bh4" },{ black = "e4", number = "46", white = "Bg5" },{ black = "Kf6", number = "47", white = "Be3" },{ black = "Ke5", number = "48", white = "Kg4" },{ black = "Kd5", number = "49", white = "Kg5" },{ black = "a5", number = "50", white = "Kf5" },{ black = "g5", number = "51", white = "Bf2" },{ black = "Kc4", number = "52", white = "Kxg5" },{ black = "Kb4", number = "53", white = "Kf5" },{ black = "Kxa4", number = "54", white = "Kxe4" },{ black = "Kb5", number = "55", white = "Kd5" },{ black = "", number = "56", white = "Kd6" }]

{-| 5th game of the 2002 match played in Russia between Judit Polgar and Garry Kasparov
<https://en.wikipedia.org/wiki/Portable_Game_Notation#Example>
-}
polgarVsKasparovPgn : String
polgarVsKasparovPgn =
    "[Event \"Russia - The Rest of the World\"]\n[Site \"Moscow RUS\"]\n[Date \"2002.09.09\"]\n[EventDate \"2002.09.08\"]\n[Round \"5\"]\n[Result \"1-0\"]\n[White \"Judit Polgar\"]\n[Black \"Garry Kasparov\"]\n[ECO \"C67\"]\n[WhiteElo \"2681\"]\n[BlackElo \"2838\"]\n[PlyCount \"84\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6 4. O-O Nxe4 5. d4 Nd6 6. Bxc6\ndxc6 7. dxe5 Nf5 8. Qxd8+ Kxd8 9. Nc3 h6 10. Rd1+ Ke8 11. h3\nBe7 12. Ne2 Nh4 13. Nxh4 Bxh4 14. Be3 Bf5 15. Nd4 Bh7 16. g4\nBe7 17. Kg2 h5 18. Nf5 Bf8 19. Kf3 Bg6 20. Rd2 hxg4+ 21. hxg4\nRh3+ 22. Kg2 Rh7 23. Kg3 f6 24. Bf4 Bxf5 25. gxf5 fxe5 26. Re1\nBd6 27. Bxe5 Kd7 28. c4 c5 29. Bxd6 cxd6 30. Re6 Rah8\n31. Rexd6+ Kc8 32. R2d5 Rh3+ 33. Kg2 Rh2+ 34. Kf3 R2h3+\n35. Ke4 b6 36. Rc6+ Kb8 37. Rd7 Rh2 38. Ke3 Rf8 39. Rcc7 Rxf5\n40. Rb7+ Kc8 41. Rdc7+ Kd8 42. Rxg7 Kc8 1-0"


polgarVsKasparovPgnPrettyish : String
polgarVsKasparovPgnPrettyish =
    "[Event \"Russia - The Rest of the World\"]\n[Site \"Moscow RUS\"]\n[Date \"2002.09.09\"]\n[EventDate \"2002.09.08\"]\n[Round \"5\"]\n[Result \"1-0\"]\n[White \"Judit Polgar\"]\n[Black \"Garry Kasparov\"]\n[ECO \"C67\"]\n[WhiteElo \"2681\"]\n[BlackElo \"2838\"]\n[PlyCount \"84\"]\n\n1. e4 e5\n2. Nf3 Nc6\n3. Bb5 Nf6\n4. O-O Nxe4\n5. d4 Nd6\n6. Bxc6 dxc6\n7. dxe5 Nf5\n8. Qxd8+ Kxd8\n9. Nc3 h6\n10. Rd1+ Ke8\n11. h3 Be7\n12. Ne2 Nh4\n13. Nxh4 Bxh4\n14. Be3 Bf5\n15. Nd4 Bh7\n16. g4 Be7\n17. Kg2 h5\n18. Nf5 Bf8\n19. Kf3 Bg6\n20. Rd2 hxg4+\n21. hxg4 Rh3+\n22. Kg2 Rh7\n23. Kg3 f6\n24. Bf4 Bxf5\n25. gxf5 fxe5\n26. Re1 Bd6\n27. Bxe5 Kd7\n28. c4 c5\n29. Bxd6 cxd6\n30. Re6 Rah8\n31. Rexd6+ Kc8\n32. R2d5 Rh3+\n33. Kg2 Rh2+\n34. Kf3 R2h3+\n35. Ke4 b6\n36. Rc6+ Kb8\n37. Rd7 Rh2\n38. Ke3 Rf8\n39. Rcc7 Rxf5\n40. Rb7+ Kc8\n41. Rdc7+ Kd8\n42. Rxg7 Kc8\n1-0\n"


polgarVsKasparovPgnTagPairParsed : List Pgn.TagPair
polgarVsKasparovPgnTagPairParsed =
    [ { title = "Event", value = "Russia - The Rest of the World" }, { title = "Site", value = "Moscow RUS" }, { title = "Date", value = "2002.09.09" }, { title = "EventDate", value = "2002.09.08" }, { title = "Round", value = "5" }, { title = "Result", value = "1-0" }, { title = "White", value = "Judit Polgar" }, { title = "Black", value = "Garry Kasparov" }, { title = "ECO", value = "C67" }, { title = "WhiteElo", value = "2681" }, { title = "BlackElo", value = "2838" }, { title = "PlyCount", value = "84" } ]


polgarVsKasparovPgnMovesParsed : List Pgn.Move
polgarVsKasparovPgnMovesParsed =
    [ { black = "e5", number = "1", white = "e4" }, { black = "Nc6", number = "2", white = "Nf3" }, { black = "Nf6", number = "3", white = "Bb5" }, { black = "Nxe4", number = "4", white = "O-O" }, { black = "Nd6", number = "5", white = "d4" }, { black = "dxc6", number = "6", white = "Bxc6" }, { black = "Nf5", number = "7", white = "dxe5" }, { black = "Kxd8", number = "8", white = "Qxd8+" }, { black = "h6", number = "9", white = "Nc3" }, { black = "Ke8", number = "10", white = "Rd1+" }, { black = "Be7", number = "11", white = "h3" }, { black = "Nh4", number = "12", white = "Ne2" }, { black = "Bxh4", number = "13", white = "Nxh4" }, { black = "Bf5", number = "14", white = "Be3" }, { black = "Bh7", number = "15", white = "Nd4" }, { black = "Be7", number = "16", white = "g4" }, { black = "h5", number = "17", white = "Kg2" }, { black = "Bf8", number = "18", white = "Nf5" }, { black = "Bg6", number = "19", white = "Kf3" }, { black = "hxg4+", number = "20", white = "Rd2" }, { black = "Rh3+", number = "21", white = "hxg4" }, { black = "Rh7", number = "22", white = "Kg2" }, { black = "f6", number = "23", white = "Kg3" }, { black = "Bxf5", number = "24", white = "Bf4" }, { black = "fxe5", number = "25", white = "gxf5" }, { black = "Bd6", number = "26", white = "Re1" }, { black = "Kd7", number = "27", white = "Bxe5" }, { black = "c5", number = "28", white = "c4" }, { black = "cxd6", number = "29", white = "Bxd6" }, { black = "Rah8", number = "30", white = "Re6" }, { black = "Kc8", number = "31", white = "Rexd6+" }, { black = "Rh3+", number = "32", white = "R2d5" }, { black = "Rh2+", number = "33", white = "Kg2" }, { black = "R2h3+", number = "34", white = "Kf3" }, { black = "b6", number = "35", white = "Ke4" }, { black = "Kb8", number = "36", white = "Rc6+" }, { black = "Rh2", number = "37", white = "Rd7" }, { black = "Rf8", number = "38", white = "Ke3" }, { black = "Rxf5", number = "39", white = "Rcc7" }, { black = "Kc8", number = "40", white = "Rb7+" }, { black = "Kd8", number = "41", white = "Rdc7+" }, { black = "Kc8", number = "42", white = "Rxg7" } ]


{-| 29th game of the 1992 match played in Yugoslavia between Bobby Fischer and Boris Spassky
<https://en.wikipedia.org/wiki/Portable_Game_Notation#Example>
-}
wikipediaPgn : String
wikipediaPgn =
    "[Event \"F/S Remove Match\"]\n[Site \"Belgrade, Serbia JUG\"]\n[Date \"1992.11.04\"]\n[Round \"29\"]\n[White \"Fischer, Robert J.\"]\n[Black \"Spassky, Boris V.\"]\n[Result \"1/2-1/2\"]\n\n1. e4 e5 2. Nf3 Nc6 3. Bb5 a6 {This opening is called the Ruy Lopez.}\n4. Ba4 Nf6 5. O-O Be7 6. Re1 b5 7. Bb3 d6 8. c3 O-O 9. h3 Nb8 10. d4 Nbd7\n11. c4 c6 12. cxb5 axb5 13. Nc3 Bb7 14. Bg5 b4 15. Nb1 h6 16. Bh4 c5 17. dxe5\nNxe4 18. Bxe7 Qxe7 19. exd6 Qf6 20. Nbd2 Nxd6 21. Nc4 Nxc4 22. Bxc4 Nb6\n23. Ne5 Rae8 24. Bxf7+ Rxf7 25. Nxf7 Rxe1+ 26. Qxe1 Kxf7 27. Qe3 Qg5 28. Qxg5\nhxg5 29. b3 Ke6 30. a3 Kd6 31. axb4 cxb4 32. Ra5 Nd5 33. f3 Bc8 34. Kf2 Bf5\n35. Ra7 g6 36. Ra6+ Kc5 37. Ke1 Nf4 38. g3 Nxh3 39. Kd2 Kb5 40. Rd6 Kc5 41. Ra6\nNf2 42. g4 Bd3 43. Re6 1/2-1/2"


sampleWikipediaPgnTagPairParsed : List Pgn.TagPair
sampleWikipediaPgnTagPairParsed =
    [ { title = "Event", value = "F/S Remove Match" }, { title = "Site", value = "Belgrade, Serbia JUG" }, { title = "Date", value = "1992.11.04" }, { title = "Round", value = "29" }, { title = "White", value = "Fischer, Robert J." }, { title = "Black", value = "Spassky, Boris V." }, { title = "Result", value = "1/2-1/2" } ]


sampleWikipediaPgnMovesParsed : List Pgn.Move
sampleWikipediaPgnMovesParsed =
    [ { black = "e5", number = "1", white = "e4" }, { black = "Nc6", number = "2", white = "Nf3" }, { black = "a6", number = "3", white = "Bb5" }, { black = "Nf6", number = "4", white = "Ba4" }, { black = "Be7", number = "5", white = "O-O" }, { black = "b5", number = "6", white = "Re1" }, { black = "d6", number = "7", white = "Bb3" }, { black = "O-O", number = "8", white = "c3" }, { black = "Nb8", number = "9", white = "h3" }, { black = "Nbd7", number = "10", white = "d4" }, { black = "c6", number = "11", white = "c4" }, { black = "axb5", number = "12", white = "cxb5" }, { black = "Bb7", number = "13", white = "Nc3" }, { black = "b4", number = "14", white = "Bg5" }, { black = "h6", number = "15", white = "Nb1" }, { black = "c5", number = "16", white = "Bh4" }, { black = "Nxe4", number = "17", white = "dxe5" }, { black = "Qxe7", number = "18", white = "Bxe7" }, { black = "Qf6", number = "19", white = "exd6" }, { black = "Nxd6", number = "20", white = "Nbd2" }, { black = "Nxc4", number = "21", white = "Nc4" }, { black = "Nb6", number = "22", white = "Bxc4" }, { black = "Rae8", number = "23", white = "Ne5" }, { black = "Rxf7", number = "24", white = "Bxf7+" }, { black = "Rxe1+", number = "25", white = "Nxf7" }, { black = "Kxf7", number = "26", white = "Qxe1" }, { black = "Qg5", number = "27", white = "Qe3" }, { black = "hxg5", number = "28", white = "Qxg5" }, { black = "Ke6", number = "29", white = "b3" }, { black = "Kd6", number = "30", white = "a3" }, { black = "cxb4", number = "31", white = "axb4" }, { black = "Nd5", number = "32", white = "Ra5" }, { black = "Bc8", number = "33", white = "f3" }, { black = "Bf5", number = "34", white = "Kf2" }, { black = "g6", number = "35", white = "Ra7" }, { black = "Kc5", number = "36", white = "Ra6+" }, { black = "Nf4", number = "37", white = "Ke1" }, { black = "Nxh3", number = "38", white = "g3" }, { black = "Kb5", number = "39", white = "Kd2" }, { black = "Kc5", number = "40", white = "Rd6" }, { black = "Nf2", number = "41", white = "Ra6" }, { black = "Bd3", number = "42", white = "g4" }, { black = "", number = "43", white = "Re6" } ]


{-| shnewto vs RadivojeVukmirovic
<https://www.chess.com/live/game/575218742>
2013.08.09
-}
sampleChessDotComPgn_02 : String
sampleChessDotComPgn_02 =
    "[Event \"Live Chess\"]\n[Site \"Chess.com\"]\n[Date \"2013.08.09\"]\n[Round \"-\"]\n[White \"shnewto\"]\n[Black \"RadivojeVukmirovic\"]\n[Result \"1-0\"]\n[ECO \"D00\"]\n[ECOUrl \"https://www.chess.com/openings/Queens-Pawn-Opening-1...d5-2.e3\"]\n[CurrentPosition \"6k1/p5Q1/1p3p1B/8/3p1n2/P1qB4/2P2PPP/5RK1 b - -\"]\n[Timezone \"UTC\"]\n[UTCDate \"2013.08.09\"]\n[UTCTime \"02:45:51\"]\n[WhiteElo \"1351\"]\n[BlackElo \"1155\"]\n[TimeControl \"1800\"]\n[Termination \"shnewto won by checkmate\"]\n[StartTime \"02:45:51\"]\n[EndDate \"2013.08.09\"]\n[EndTime \"03:00:20\"]\n[Link \"https://www.chess.com/live/game/575218742\"]\n\n1. d4 d5\n2. e3 e6\n3. Nf3 Nc6\n4. Nc3 Bb4\n5. a3 Bxc3+\n6. bxc3 Qe7\n7. Qd3 e5\n8. Nxe5 Nxe5\n9. dxe5 Qxe5\n10. Qd4 f6\n11. Bd3 b6\n12. O-O c5\n13. Qf4 Qxc3\n14. Qd6 Qe5\n15. Qc6+ Kf7\n16. Qxa8 Qxa1\n17. Qxc8 Ne7\n18. Qxh8 d4\n19. exd4 cxd4\n20. Qxh7 Qc3\n21. Bh6 Ke6\n22. Qxg7 Nd5\n23. Qg6 Nf4\n24. Qf5+ Kf7\n25. Qd7+ Kg8\n26. Qg7# 1-\n1-0\n"


sampleChessDotComPgnTagPairParsed_02 : List Pgn.TagPair
sampleChessDotComPgnTagPairParsed_02 =
    [ { title = "Event", value = "Live Chess" }, { title = "Site", value = "Chess.com" }, { title = "Date", value = "2013.08.09" }, { title = "Round", value = "-" }, { title = "White", value = "shnewto" }, { title = "Black", value = "RadivojeVukmirovic" }, { title = "Result", value = "1-0" }, { title = "ECO", value = "D00" }, { title = "ECOUrl", value = "https://www.chess.com/openings/Queens-Pawn-Opening-1...d5-2.e3" }, { title = "CurrentPosition", value = "6k1/p5Q1/1p3p1B/8/3p1n2/P1qB4/2P2PPP/5RK1 b - -" }, { title = "Timezone", value = "UTC" }, { title = "UTCDate", value = "2013.08.09" }, { title = "UTCTime", value = "02:45:51" }, { title = "WhiteElo", value = "1351" }, { title = "BlackElo", value = "1155" }, { title = "TimeControl", value = "1800" }, { title = "Termination", value = "shnewto won by checkmate" }, { title = "StartTime", value = "02:45:51" }, { title = "EndDate", value = "2013.08.09" }, { title = "EndTime", value = "03:00:20" }, { title = "Link", value = "https://www.chess.com/live/game/575218742" } ]


sampleChessDotComPgnMovesParsed_02 : List Pgn.Move
sampleChessDotComPgnMovesParsed_02 =
    [ { black = "d5", number = "1", white = "d4" }, { black = "e6", number = "2", white = "e3" }, { black = "Nc6", number = "3", white = "Nf3" }, { black = "Bb4", number = "4", white = "Nc3" }, { black = "Bxc3+", number = "5", white = "a3" }, { black = "Qe7", number = "6", white = "bxc3" }, { black = "e5", number = "7", white = "Qd3" }, { black = "Nxe5", number = "8", white = "Nxe5" }, { black = "Qxe5", number = "9", white = "dxe5" }, { black = "f6", number = "10", white = "Qd4" }, { black = "b6", number = "11", white = "Bd3" }, { black = "c5", number = "12", white = "O-O" }, { black = "Qxc3", number = "13", white = "Qf4" }, { black = "Qe5", number = "14", white = "Qd6" }, { black = "Kf7", number = "15", white = "Qc6+" }, { black = "Qxa1", number = "16", white = "Qxa8" }, { black = "Ne7", number = "17", white = "Qxc8" }, { black = "d4", number = "18", white = "Qxh8" }, { black = "cxd4", number = "19", white = "exd4" }, { black = "Qc3", number = "20", white = "Qxh7" }, { black = "Ke6", number = "21", white = "Bh6" }, { black = "Nd5", number = "22", white = "Qxg7" }, { black = "Nf4", number = "23", white = "Qg6" }, { black = "Kf7", number = "24", white = "Qf5+" }, { black = "Kg8", number = "25", white = "Qd7+" }, { black = "", number = "26", white = "Qg7#" } ]
