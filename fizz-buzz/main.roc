#PROGRAM: Print the integers from 1 to 100, replacing multiples of three with "Fizz", 
#multiples of five with "Buzz", and multiples of both three and five with "FizzBuzz".

app [main] {pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.12.0/Lb8EgiejTUzbggO2HVVuPJFkwvvsfW6LojkLR20kTVE.tar.br" }

import pf.Stdout
import pf.Task

main = List.range { start: At 1, end: At 100 }
    |> List.map fizzBuzz
    |> Str.joinWith ","
    |> Stdout.line

## Determine the FizzBuzz value for a given integer.
## Returns "Fizz" for multiples of 3, "Buzz" for
## multiples of 5, "FizzBuzz" for multiples of both
## 3 and 5, and the original number for anything else.

fizzBuzz : I32 -> Str
fizzBuzz = \number ->
    fizz = number % 3 == 0
    buzz = number % 5 == 0

    if fizz && buzz then 
        "FizzBuzz"
    else if fizz then 
        "Fizz"
    else if buzz then 
        "Buzz"
    else 
        Num.toStr number

    
## Test Case 1: not a multiple of 3 or 5
expect fizzBuzz 1 == "1"
expect fizzBuzz 7 == "7"

## Test Case 2: multiple of 3
expect fizzBuzz 3 == "Fizz"
expect fizzBuzz 9 == "Fizz"

## Test Case 3: multiple of 5
expect fizzBuzz 5 == "Buzz"
expect fizzBuzz 20 == "Buzz"

## Test Case 4: multiple of both 3 and 5
expect fizzBuzz 15 == "FizzBuzz"
expect fizzBuzz 45 == "FizzBuzz"
