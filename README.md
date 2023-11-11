[![ci status](https://github.com/shnewto/pgn/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/shnewto/pgn/actions)
[![latest version](https://reiner-dolp.github.io/elm-badges/shnewto/pgn/version.svg)](https://package.elm-lang.org/packages/shnewto/pgn/latest/)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

# Pgn
`Pgn` is a library for parsing "Portable Game Notation" (PGN) for standard chess. PGN is a plain text standard for recording chess games. For more information check out [the Wikipedia entry on PGN](https://en.wikipedia.org/wiki/Portable_Game_Notation) or [the PGN spec itself](https://ia802908.us.archive.org/26/items/pgn-standard-1994-03-12/PGN_standard_1994-03-12.txt)

## A look at the data

Here's a relatively simple PGN for a classic game between Judit Polgar and Garry Kasparov.
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

The data begins with a roster or tag pairs that typically contain archival or supplemental information for the game itself. Here we can see that the game took place at an event called "Russia - The Rest of the World" in Moscow, Russia, in September of 2002.
```
[Event "Russia - The Rest of the World"]
[Site "Moscow RUS"]
[Date "2002.09.09"]
...
```

It's **important** to note that tag pairs are treated something like key, value pairs and the value must be in quotes! 

After the tag pairs is the movetext that describes moves of the game, here in algebraic notation. The game starts with White moving their e2 pawn to the e4 square. Black follows by moving the e7 pawn to e5. On the 13th move White's knight captures on the h4 square and Black captures back on the h4 square.
```
1. e4 e5 2. Nf3 Nc6 3. Bb5 Nf6 4. O-O Nxe4 5. d4 Nd6 6. Bxc6
dxc6 7. dxe5 Nf5 8. Qxd8+ Kxd8 9. Nc3 h6 10. Rd1+ Ke8 11. h3
Be7 12. Ne2 Nh4 13. Nxh4 Bxh4 14. Be3 Bf5
```

This library also supports inline `{}` and end-of-line `;` comments in the movetext (though they're just consumed and not returned in the Pgn object itself). For example:
```
1. {a nice handshake to get the game going} d4 {Queen's Pawn} 1... f5 {Dutch defense}
2. a3 2.. h6; Theory's been thrown out the window!
```

## Notes
I'm still thinking about what to do with comments and whether I should be allowing them in and around tag pairs. If you have thoughts on the matter, let me know :)

## Issues
If you spot an issue or have trouble parsing a PGN I'm sorry! But also, I'd love to hear about it. Please create an issue and include the PGN itself in your report. And of course, feel free to make a PR 💖
