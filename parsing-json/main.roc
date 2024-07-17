# PROGRAM: Translates JSON fields from PascalCase (first letter capitalized)
# to camelCase (first letter uncapitalized), which is what Roc field names always use.

app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.12.0/Lb8EgiejTUzbggO2HVVuPJFkwvvsfW6LojkLR20kTVE.tar.br",
    json: "https://github.com/lukewilliamboswell/roc-json/releases/download/0.8.0/BlWJJh_ouV7c_IwvecYpgpR3jOCzVO-oyk-7ISdl2S4.tar.br",
}

import cli.Stdout
import cli.Task
import json.Core exposing [jsonWithOptions]

Bet : {
    id: I64;
    time: Str;
    wagerType: Str;
    gameType: Str;
    sport: Str;
    description: Str;
    points: Str;
    odds: Str;
    amount: F32;
    player: Player;
}


Player : {
    id: I64;
    username: Str;
    master: Bool;
    wins: I64;
    losses: I64;
    net: I64;
    created: Str;
}