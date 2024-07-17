module
    [Bet, Player]

Bet : {
    id: I64,
    time: Str,
    wagerType: Str,
    gameType: Str,
    sport: Str,
    description: Str,
    points: Str,
    odds: Str,
    amount: F32,
    player: Player,
}

Player : {
    id: I64,
    username: Str,
    master: Bool,
    wins: I64,
    losses: I64,
    net: I64,
    created: Str,
}