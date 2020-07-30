# Pgn
`Pgn` is a library for parsing "Portable Game Notation" (PGN) for standard chess. PGN is a plain text standard for recording chess games. For more information check out [the Wikipedia entry on PGN](https://en.wikipedia.org/wiki/Portable_Game_Notation) or [the PGN spec itself](https://ia802908.us.archive.org/26/items/pgn-standard-1994-03-12/PGN_standard_1994-03-12.txt)

## Parsing

This PGN for a classic game between Judit Polgar and Gary Kasparov 
```
[Event "Russia - The Rest of the World"]
[Site "Moscow RUS"]
[Date "2002.09.09"]
[EventDate "2002.09.08"]
[Round "5"]
[Result "1-0"]
[White "Judit Polgar"]
[Black "Garry Kasparov"]
[ECO "C67"]
[WhiteElo "2681"]
[BlackElo "2838"]
[PlyCount "84"]

1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6 4. O-O Nxe4 5. d4 Nd6 6. Bxc6
dxc6 7. dxe5 Nf5 8. Qxd8+ Kxd8 9. Nc3 h6 10. Rd1+ Ke8 11. h3
Be7 12. Ne2 Nh4 13. Nxh4 Bxh4 14. Be3 Bf5 15. Nd4 Bh7 16. g4
Be7 17. Kg2 h5 18. Nf5 Bf8 19. Kf3 Bg6 20. Rd2 hxg4+ 21. hxg4
Rh3+ 22. Kg2 Rh7 23. Kg3 f6 24. Bf4 Bxf5 25. gxf5 fxe5 26. Re1
Bd6 27. Bxe5 Kd7 28. c4 c5 29. Bxd6 cxd6 30. Re6 Rah8
31. Rexd6+ Kc8 32. R2d5 Rh3+ 33. Kg2 Rh2+ 34. Kf3 R2h3+
35. Ke4 b6 36. Rc6+ Kb8 37. Rd7 Rh2 38. Ke3 Rf8 39. Rcc7 Rxf5
40. Rb7+ Kc8 41. Rdc7+ Kd8 42. Rxg7 Kc8 1-0
```

