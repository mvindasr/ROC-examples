# PROGRAM: Translates JSON fields from PascalCase (first letter capitalized)
# to camelCase (first letter uncapitalized), which is what Roc field names always use.

app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.12.0/Lb8EgiejTUzbggO2HVVuPJFkwvvsfW6LojkLR20kTVE.tar.br",
    json: "https://github.com/lukewilliamboswell/roc-json/releases/download/0.8.0/BlWJJh_ouV7c_IwvecYpgpR3jOCzVO-oyk-7ISdl2S4.tar.br",
}

import cli.Stdout
import cli.Task
import json.Core exposing [jsonWithOptions]
import Decode exposing [fromBytesPartial]
import Interfaces.Bet exposing [Bet]

main = 
    requestBody = Str.toUtf8 "{\"Id\":13,\"Time\":\"Jul 14, 13:00\",\"WagerType\":\"STRAIGHT\",\"GameType\":\"GAME\",\"Player\":{\"Id\":100,\"Username\":\"TestUser\",\"Master\":true,\"Wins\":235,\"Losses\":32,\"Net\":203,\"Created\":\"Mar 23, 2024\"},\"Description\":\"Bet description\",\"Sport\":\"NBA\", \"Points\":\"+7.5\", \"Odds\":\"-100\", \"Amount\":25.50}"

    decoder = jsonWithOptions { fieldNameMapping: PascalCase }
    decoded : DecodeResult Bet
    decoded = fromBytesPartial requestBody decoder

    when decoded.result is
        Ok bet -> Stdout.line 
            """
            -------------------------------------------
                  Successfully parsed Bet ID. $(Num.toStr bet.id)
            -------------------------------------------
            Time: $(bet.time)
            Wager-type: $(bet.wagerType)
            Sport: $(bet.sport)
            Points: $(bet.points)
            Odds: $(bet.odds)
            Amount: $(Num.toStr bet.amount)
            Player: $(bet.player.username)
            Master: $(if bet.player.master then "Yes" else "No")
            Wins: $(Num.toStr bet.player.wins)
            Losses: $(Num.toStr bet.player.losses)
            -------------------------------------------
            """
        Err _ -> Task.err (Exit 1 "Error, failed to decode bet")

